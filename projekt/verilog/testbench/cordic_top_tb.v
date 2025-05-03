`timescale 1ns / 1ps

module cordic_top_tb;
    integer infile, outfile, r;
    reg [31:0] angle_ieee754;
    reg clk, rst, start;
    wire [15:0] cos_q15, sin_q15;
    wire valid;

    cordic_top dut(
        .clk(clk),
        .rst(rst),
        .start(start),
        .angle_ieee754(angle_ieee754),
        .cos_q15(cos_q15),
        .sin_q15(sin_q15),
        .valid(valid)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        infile = 0;
        outfile = 0;
        r = 0;
        angle_ieee754 = 0;
        clk = 0;
        rst = 1;
        start = 0;

        $dumpfile("./vcd/cordic_top_tb.vcd");     // Name of the VCD output file
        $dumpvars(0, cordic_top_tb);        // Dump all variables in this module
        infile = $fopen("./utils/input_degrees.txt", "r");
        outfile = $fopen("./utils/output_results.txt", "w");

        if (infile == 0) begin
            $display("Error opening infile.");
            $finish;
        end

        if (outfile == 0) begin
            $display("Error opening outfile.");
            $finish;
        end

        while (!$feof(infile)) begin
            rst = 1;
            #10;
            rst = 0;
            #10;

            r = $fscanf(infile, "%h\n", angle_ieee754);
            #10;

            start = 1;
            #10;
            start = 0;
            wait(valid);

            $fwrite(outfile, "%h\t%h\t%h\n", angle_ieee754, cos_q15, sin_q15);
        end

        $fclose(infile);
        $fclose(outfile);
        $finish;
    end
endmodule
