`timescale 1ns/1ps

module gpioemu_tb;

    reg clk;
    reg n_reset;
    reg swr, srd;
    reg [15:0] saddress;
    reg [31:0] sdata_in;
    wire [31:0] sdata_out;

    wire [31:0] gpio_in_flat;
    wire [31:0] gpio_out_flat;
    wire [1:0]  valid_out;
    wire [1:0]  valid_in;

    wire [15:0] gpio_in [1:0];
    wire [15:0] gpio_out [1:0];

    assign gpio_in[0] = gpio_in_flat[15:0];
    assign gpio_in[1] = gpio_in_flat[31:16];

    assign gpio_out[0] = gpio_out_flat[15:0];
    assign gpio_out[1] = gpio_out_flat[31:16];

    // Clock
    initial clk = 0;
    always #5 clk = ~clk;

    // Two peripherals
    simple_register periph0 (
        .clk(clk),
        .data_in(gpio_out[0]),
        .data_out(gpio_in[0]),
        .valid_in(valid_out[0]),
        .valid_out(valid_in[0])
    );

    simple_register periph1 (
        .clk(clk),
        .data_in(gpio_out[1]),
        .data_out(gpio_in[1]),
        .valid_in(valid_out[1]),
        .valid_out(valid_in[1])
    );

    parameter [15:0] ADDR0 = 16'h0010;
    parameter [15:0] ADDR1 = 16'h0020;

    parameter [31:0] ADDR_LIST = {ADDR1, ADDR0};

    gpioemu #(
        .NUM_PERIPHERALS(2),
        .ADDR_WIDTH(16),
        .DATA_WIDTH(16),
        .ADDR_LIST(ADDR_LIST)
    ) emu (
        .clk(clk),
        .n_reset(n_reset),
        .saddress(saddress),
        .swr(swr),
        .srd(srd),
        .sdata_in(sdata_in),
        .sdata_out(sdata_out),
        .gpio_in_flat(gpio_in_flat),
        .gpio_out_flat(gpio_out_flat),
        .valid_out(valid_out),
        .valid_in(valid_in)
    );

    initial begin
        $dumpfile("gpioemu.vcd");
        $dumpvars(0, gpioemu_tb);

        n_reset = 0; swr = 0; srd = 0;
        #12 n_reset = 1;

        // Write to 0x0010
        #10 saddress = 16'h0010; sdata_in = 32'h00001234; swr = 1;
        #10 swr = 0;

        #20;

        // Read from 0x0010
        #10 saddress = 16'h0010; srd = 1;
        #10 srd = 0;

        #20;

        // Write to 0x0020
        #10 saddress = 16'h0020; sdata_in = 32'h0000ABCD; swr = 1;
        #10 swr = 0;

        // Read from 0x0020
        #10 saddress = 16'h0020; srd = 1;
        #10 srd = 0;

        #50 $finish;
    end

endmodule
