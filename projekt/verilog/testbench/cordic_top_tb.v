`timescale 1ns / 1ps

module cordic_top_tb;
    integer infile, outfile, r;
    reg [31:0] angle_ieee754;
    reg clk, rst, start;
    wire signed [15:0] cos_out, sin_out;
    wire valid;

    real sin_pre, cos_pre, sin_out_real, cos_out_real, sin_err, cos_err;
    integer angle_deg;
    reg [15:0] sin_q15_in, cos_q15_in;  // Optional, if you want to compare fixed-point too

    cordic_top dut(
        .clk(clk),
        .rst(rst),
        .start(start),
        .angle_ieee754(angle_ieee754),
        .cos_q15(cos_out),
        .sin_q15(sin_out),
        .valid(valid)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        infile = $fopen("./utils/input_data.txt", "r");
        outfile = $fopen("./utils/results.txt", "w");

        if (infile == 0) begin
            $display("Error opening infile.");
            $finish;
        end

        if (outfile == 0) begin
            $display("Error opening outfile.");
            $finish;
        end

        angle_ieee754 = 0;
        clk = 0;
        rst = 1;
        start = 0;

        $dumpfile("./vcd/cordic_top_tb.vcd");
        $dumpvars(0, cordic_top_tb);

        $fwrite(outfile, "angle_deg ieee754_hex   sin_pre        cos_pre        sin_out   cos_out    sin_out_real  cos_out_real    sin_err       cos_err\n");
        while (!$feof(infile)) begin
            rst = 1;
            #10;
            rst = 0;
            #10;

            // Read angle (degrees), IEEE754 hex, sin_q15, cos_q15, real sin, real cos
            r = $fscanf(infile, "%d\t%h\t%h\t%h\t%f\t%f\n",
                        angle_deg, angle_ieee754, cos_q15_in, sin_q15_in,
                        sin_pre, cos_pre);

            #10;
            start = 1;
            #10;
            start = 0;
            wait (valid);

            sin_out_real = sin_out/32768.0;
            cos_out_real = cos_out/32768.0;
            sin_err = sin_out_real - sin_pre;
            cos_err = cos_out_real - cos_pre;

            // Print results: input angle, output Q15 values, precomputed floats
            $fwrite(outfile, "%4d %4s %h %4s %9.6f %4s %9.6f %4s %h %4s %h %4s %9.6f %4s %9.6f %4s %9.6f %4s %9.6f\n",
                    angle_deg, "", angle_ieee754, "", sin_pre, "", cos_pre, "",
                    sin_out, "", cos_out, "",
                    sin_out_real, "", cos_out_real, "",
                    sin_err, "", cos_err
            );
        end

        $fclose(infile);
        $fclose(outfile);
        $finish;
    end
endmodule
