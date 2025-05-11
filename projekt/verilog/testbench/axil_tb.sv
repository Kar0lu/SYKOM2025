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

    initial BREADY = 1'b0;
    initial AWVALID = 1'b0;
    initial WVALID  = 1'b0;
    initial RREADY = 1'b0;
    initial ARVALID = 1'b0;


    initial begin
        $dumpfile("./vcd/axil_tb.vcd");
        $dumpvars(0, axil_tb);
        
        # 0 n_reset = 1'b0;
        # 5 n_reset = 1'b1;

        // Writing
        axi_write(4'h4, 32'h43330000, 4'hF);
        axi_write(4'h0, 32'd1, 4'hF);


        // Test read
        poll_and_read_result(cos_read_data, sin_read_data);
        $display("Cos: %08X", cos_read_data);
        $display("Sin: %08X", sin_read_data);
        if (cos_read_data !== 32'h00008004) $fatal(1, "Cos error");
        if (sin_read_data !== 32'h0000023F) $fatal(1, "Sin error");

        $display("Test PASSED");
        $finish;

    end

endmodule 