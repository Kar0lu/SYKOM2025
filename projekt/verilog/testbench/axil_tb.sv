`timescale 1ns/1ns

module axil_tb;

    parameter ADDR_WIDTH = 4;
    parameter CORDIC_CLK_DIV = 1;

    reg clk;
    reg n_reset;
    initial clk = 0;
    always #1 clk = ~clk;

    // Create regisers and wires for AXI

    // Signals to UUT
    reg AWVALID, WVALID, BREADY, ARVALID, RREADY;

    // Addresses
    reg [ADDR_WIDTH-1:0] AWADDR, ARADDR;

    // Write strobe
    reg [3:0] WSTRB;

    // Data
    reg [31:0] WDATA;
    wire [31:0] RDATA;

    // Signals from UUT
    wire AWREADY, WREADY, BVALID, ARREADY, RVALID;

    // RW responses from UUT
    wire [1:0] RRESP, BRESP;

    // For read test
    logic [31:0] cos_read_data, sin_read_data;
    integer infile, outfile, r;
    integer angle_deg;
    real    sin_pre, cos_pre,
            sin_out_real, cos_out_real,
            sin_err, cos_err,
            sin_err_acc, cos_err_acc;
    reg signed [15:0] cos_ieee754, sin_ieee754;
    reg [31:0] angle_ieee754;
    reg [15:0] sin_ieee754_in, cos_ieee754_in;

    axil #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .CLK_DIV_LEN(CORDIC_CLK_DIV)
    ) AXI_LITE (
        // Global signals
        .S_AXI_ACLK(clk),
        .S_AXI_ARESETN(n_reset),

        // AXI4-Lite slave interface

        // Write address channel
        .S_AXI_AWADDR(AWADDR),      // Write address
        .S_AXI_AWVALID(AWVALID),               // Write address valid
        .S_AXI_AWREADY(AWREADY),               // Write address ready (slave is ready for address)

        // Write data channel
        .S_AXI_WDATA(WDATA),                 // Write data
        .S_AXI_WSTRB(WSTRB),                 // Strobe (which bytes are valid)
        .S_AXI_WVALID(WVALID),                // Write data valid
        .S_AXI_WREADY(WREADY),                // Write data ready (slave is ready for data)

        // Write response channel
        .S_AXI_BREADY(BREADY),                // Response ready (Master can accept the response)
        .S_AXI_BRESP(BRESP),                 // Write response
        .S_AXI_BVALID(BVALID),                // Write response valid
        
        // Read address channel
        .S_AXI_ARADDR(ARADDR),      // Read address
        .S_AXI_ARVALID(ARVALID),               // Read address valid
        .S_AXI_ARREADY(ARREADY),               // Read address ready (slave is ready for address)

        // Read data channel
        .S_AXI_RDATA(RDATA),                 // Read data
        .S_AXI_RRESP(RRESP),                 // Read response
        .S_AXI_RVALID(RVALID),                // Read valid (data on bus is valid)
        .S_AXI_RREADY(RREADY)                 // Read ready (master can read from bus)
    );

    task axi_write(input [ADDR_WIDTH-1:0] addr, input [31:0] data, input [3:0] strobe);
        begin
            @(posedge clk);
            AWADDR  <= addr;
            AWVALID <= 1;
            WDATA   <= data;
            WSTRB   <= strobe;
            WVALID  <= 1;
            BREADY <= 1;

            wait(AWREADY && WREADY);
            @(posedge clk);
            AWVALID <= 0;
            WVALID  <= 0;

            wait(BVALID);
            @(posedge clk);
            BREADY <= 0;
        end
    endtask

    task axi_read(input [ADDR_WIDTH-1:0] addr, output [31:0] data);
        begin
            @(posedge clk);
            ARADDR  <= addr;
            ARVALID <= 1;
            RREADY <= 1;

            wait(ARREADY);
            @(posedge clk);
            ARVALID <= 0;

            @(posedge clk);
            data = RDATA;
            RREADY <= 0;
        end
    endtask

    task poll_and_read_result(
    output[31:0] cos_res,
    output[31:0] sin_res
    );
        logic [31:0] status;

        begin : poll_loop
        forever
        begin
            axi_read(4'd0, status);
            if (status == 32'h10000)
                disable poll_loop;
        end
        end

        axi_read(4'h8, cos_res);
        axi_read(4'hC, sin_res);
    endtask


    task test_with_files();
    $fwrite(outfile,"%9s %15s %15s %15s %15s %15s %15s %15s %15s %15s %15s\n",
                "angle_deg", "ieee754_hex",  
                "sin_pre", "sin_out", "sin_out_real", "sin_err", 
                "cos_pre", "cos_out", "cos_out_real", "cos_err",
                "flip_out"
                
        );
        while (!$feof(infile)) begin
            // Read angle (degrees), IEEE754 hex, sin_ieee754, cos_ieee754, real sin, real cos
            r = $fscanf(infile, "%d\t%h\t%h\t%h\t%f\t%f\n",
                        angle_deg, angle_ieee754, cos_ieee754_in, sin_ieee754_in,
                        sin_pre, cos_pre);
            $display("\nTESTING ANGLE\t\t%d", angle_deg);

            // Writing to registers
            axi_write(4'h4, angle_ieee754, 4'hF);
            axi_write(4'h0, 32'd1, 4'hF);

            // Polling and reading
            poll_and_read_result(cos_read_data, sin_read_data);

            cos_ieee754 = cos_read_data[15:0];
            sin_ieee754 = sin_read_data[15:0];

            sin_out_real = sin_ieee754/32768.0;
            cos_out_real = cos_ieee754/32768.0;
            sin_err = sin_out_real - sin_pre;
            cos_err = cos_out_real - cos_pre;
            sin_err_acc = sin_err_acc + sin_err * sin_err;
            cos_err_acc = cos_err_acc + cos_err * cos_err;

            // Print results: input angle, output Q15 values, precomputed floats
            $fwrite(outfile, "%9d %15h %15.6f %15h %15.6f %15.6f %15.6f %15h %15.6f %15.6f\n",
                    angle_deg, angle_ieee754,   
                    sin_pre, sin_ieee754, sin_out_real, sin_err, 
                    cos_pre, cos_ieee754, cos_out_real, cos_err
            );
        end

        $fwrite(outfile, "Accumulated relative sin error: %f\n", sin_err_acc/360);
        $fwrite(outfile, "Accumulated relative cos error: %f", cos_err_acc/360);
        $fclose(infile);
        $fclose(outfile);
    endtask

    initial BREADY = 1'b0;
    initial AWVALID = 1'b0;
    initial WVALID  = 1'b0;
    initial RREADY = 1'b0;
    initial ARVALID = 1'b0;


    initial begin
        infile = $fopen("./utils/input_data.txt", "r");
        outfile = $fopen("./utils/results_through_AXI.txt", "w");

        if (infile == 0) begin
            $display("Error opening infile.");
            $finish;
        end

        if (outfile == 0) begin
            $display("Error opening outfile.");
            $finish;
        end

        $dumpfile("./vcd/axil_tb.vcd");
        $dumpvars(0, axil_tb);
        
        # 0 n_reset = 1'b0;
        # 5 n_reset = 1'b1;

        test_with_files();

        $display("Test FINISHED");
        $finish;

    end

endmodule 