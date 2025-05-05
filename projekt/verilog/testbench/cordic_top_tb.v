`timescale 1ns / 1ps

module cordic_top_tb;
    integer infile, outfile, r;
    integer angle_deg;
    real    sin_pre, cos_pre,
            sin_out_real, cos_out_real,
            sin_err, cos_err,
            sin_err_acc, cos_err_acc;

    reg clk, rst, valid_in;
    reg [31:0] angle_ieee754;
    
    wire signed [15:0] cos_ieee754, sin_ieee754;
    wire valid;
    wire signed [2:0] flip_out;

    
    
    reg [15:0] sin_ieee754_in, cos_ieee754_in;  // Optional, if you want to compare fixed-point too
    
    cordic_top dut(
        .clk(clk),
        .rst(rst),
        .valid_in(valid_in),
        .angle_ieee754(angle_ieee754),
        .cos_ieee754(cos_ieee754),
        .sin_ieee754(sin_ieee754),
        .valid(valid),
        .flip_out(flip_out)
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

        clk = 0;
        rst = 1;
        valid_in = 0;

        $dumpfile("./vcd/cordic_top_tb.vcd");
        $dumpvars(0, cordic_top_tb);

        $fwrite(outfile,"%9s %15s %15s %15s %15s %15s %15s %15s %15s %15s %15s\n",
                "angle_deg", "ieee754_hex",  
                "sin_pre", "sin_out", "sin_out_real", "sin_err", 
                "cos_pre", "cos_out", "cos_out_real", "cos_err",
                "flip_out"
                
        );
        while (!$feof(infile)) begin
            rst = 1;
            #10;
            rst = 0;
            #10;

            // Read angle (degrees), IEEE754 hex, sin_ieee754, cos_ieee754, real sin, real cos
            r = $fscanf(infile, "%d\t%h\t%h\t%h\t%f\t%f\n",
                        angle_deg, angle_ieee754, cos_ieee754_in, sin_ieee754_in,
                        sin_pre, cos_pre);
            $display("\nTESTING ANGLE\t\t%d", angle_deg);

            #10;
            valid_in = 1;
            #10;
            valid_in = 0;
            wait (valid);
            #5;

            sin_out_real = sin_ieee754/32768.0;
            cos_out_real = cos_ieee754/32768.0;
            sin_err = sin_out_real - sin_pre;
            cos_err = cos_out_real - cos_pre;
            sin_err_acc = sin_err_acc + sin_err * sin_err;
            cos_err_acc = cos_err_acc + cos_err * cos_err;

            // Print results: input angle, output Q15 values, precomputed floats
            $fwrite(outfile, "%9d %15h %15.6f %15h %15.6f %15.6f %15.6f %15h %15.6f %15.6f %15d\n",
                    angle_deg, angle_ieee754,   
                    sin_pre, sin_ieee754, sin_out_real, sin_err, 
                    cos_pre, cos_ieee754, cos_out_real, cos_err,
                    flip_out
            );
        end

        $fwrite(outfile, "Accumulated relative sin error: %f\n", sin_err_acc/360);
        $fwrite(outfile, "Accumulated relative cos error: %f", cos_err_acc/360);
        $fclose(infile);
        $fclose(outfile);
        $finish;
    end
endmodule
