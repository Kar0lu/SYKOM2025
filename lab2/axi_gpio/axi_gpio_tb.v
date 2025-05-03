`timescale 1ns/1ns

module axi_gpio_tb;

    parameter ADDR_WIDTH = 5;

    reg clk;
    reg n_reset;
    initial clk = 0;
    always #1 clk = ~clk;

    wire [31:0] reg0_axi, axi_reg0,
                reg1_axi, axi_reg1,
                reg2_axi, axi_reg2,
                reg3_axi, axi_reg3,
                reg4_axi, axi_reg4;

    wire we0, we1, we2, we3, we4,
         reg0_valid, reg1_valid, reg2_valid, reg3_valid, reg4_valid;

    // Create regisers for AXI

    // Signals to UUT
    reg AWVALID, WVALID, BREADY, ARVALID, RREADY;

    // Addresses
    reg [4:0] AWADDR, ARADDR;

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
    logic [31:0] read_data;

    simple_register reg0_ext(
        .clk(clk),
        .data_in(axi_reg0),
        .data_out(reg0_axi),
        .valid(reg0_valid),
        .we(we0)
    );

    simple_register reg1_ext(
        .clk(clk),
        .data_in(axi_reg1),
        .data_out(reg1_axi),
        .valid(reg1_valid),
        .we(we1)
    );

    simple_register reg2_ext(
        .clk(clk),
        .data_in(axi_reg2),
        .data_out(reg2_axi),
        .valid(reg2_valid),
        .we(we2)
    );

    simple_register reg3_ext(
        .clk(clk),
        .data_in(axi_reg3),
        .data_out(reg3_axi),
        .valid(reg3_valid),
        .we(we3)
    );

    simple_register reg4_ext(
        .clk(clk),
        .data_in(axi_reg4),
        .data_out(reg4_axi),
        .valid(reg4_valid),
        .we(we4)
    );

    axi_gpio #(
        .ADDR_WIDTH(ADDR_WIDTH)
    ) AXI_LITE (
        // To module
        .slv_reg0_out(axi_reg0),
        .slv_reg0_we_out(we0),
        .slv_reg0_in(reg0_axi),
        .slv_reg0_valid(reg0_valid),

        .slv_reg1_out(axi_reg1),
        .slv_reg1_we_out(we1),
        .slv_reg1_in(reg1_axi),
        .slv_reg1_valid(reg1_valid),

        .slv_reg2_out(axi_reg2),
        .slv_reg2_we_out(we2),
        .slv_reg2_in(reg2_axi),
        .slv_reg2_valid(reg2_valid),

        .slv_reg3_out(axi_reg3),
        .slv_reg3_we_out(we3),
        .slv_reg3_in(reg3_axi),
        .slv_reg3_valid(reg3_valid),

        .slv_reg4_out(axi_reg4),
        .slv_reg4_we_out(we4),
        .slv_reg4_in(reg4_axi),
        .slv_reg4_valid(reg4_valid),

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

            wait(AWREADY && WREADY);
            @(posedge clk);
            AWVALID <= 0;
            WVALID  <= 0;
            BREADY <= 1;

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



    initial begin
        $dumpfile("axi_gpio_tb.vcd");
        $dumpvars(0, axi_gpio_tb);
        
        # 0 n_reset = 1'b0;
        # 5 n_reset = 1'b1;

        // Writing
        axi_write(5'h0, 32'hFACEB00C, 4'hF);
        axi_write(5'h4, 32'hCAFE1234, 4'hF);
        axi_write(5'h8, 32'hFACEB00C, 4'hF);
        axi_write(5'h12, 32'hCAFE1234, 4'hF);
        axi_write(5'h16, 32'hFACEB00C, 4'hF);

        // Test read
        axi_read(5'h0, read_data);
        $display("Read from 0x0: %08X", read_data);
        if (read_data !== 32'hFACEB00C) $error(1, "Read-back mismatch");

        axi_read(5'h4, read_data);
        $display("Read from 0x4: %08X", read_data);
        if (read_data !== 32'hCAFE1234) $error(1, "Read-back mismatch");

        axi_read(5'h8, read_data);
        $display("Read from 0x8: %08X", read_data);
        if (read_data !== 32'hFACEB00C) $error(1, "Read-back mismatch");

        axi_read(5'h12, read_data);
        $display("Read from 0x12: %08X", read_data);
        if (read_data !== 32'hCAFE1234) $error(1, "Read-back mismatch");

        axi_read(5'h16, read_data);
        $display("Read from 0x16: %08X", read_data);
        if (read_data !== 32'hFACEB00C) $error(1, "Read-back mismatch");

        $display("Test PASSED");
        # 20 $finish;

    end

endmodule 