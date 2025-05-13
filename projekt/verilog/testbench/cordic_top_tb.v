`timescale 1ns / 1ps

module cordic_top_tb;

    `define ABS_DIFF(a, b) ((a > b) ? (a - b) : (b - a))
    parameter WIDTH = 32;
    
    // simulation variables
    real sim_angle_real;
    reg [31:0] sim_angle_int, sim_angle_frac;
    reg [WIDTH-1: 0] sim_angle_fixed, sim_sin_fixed, sim_cos_fixed, sim_sin_lib, sim_cos_lib, sim_sin_float, sim_cos_float;
    integer sim_flips;

    // circuit variables
    reg clk, rst, valid_in;
    reg [31:0] sim_angle_float;
    wire [31:0] sin_float, cos_float;
    wire done;

    // circuit variables (for test)
    wire signed [31:0] angle_int, angle_frac;
    wire signed [WIDTH-1:0] angle_fixed;
    wire signed [2:0] flips;
    wire signed [WIDTH-1:0] sin_fixed, cos_fixed;

    // testbench variables
    integer in_file, result_file, test_file, r;
    real sin_err, cos_err,
         sin_err_acc, cos_err_acc;
        
    cordic_top dut(
        .clk(clk),
        .rst(rst),
        .valid_in(valid_in),
        .angle_float(sim_angle_float),
        .cos_float(cos_float),
        .sin_float(sin_float),
        .done(done),
        
        // testing
        .flips(flips),
        .angle_int(angle_int),
        .angle_frac(angle_frac),
        .angle_fixed(angle_fixed),
        .sin_fixed(sin_fixed),
        .cos_fixed(cos_fixed)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        in_file = $fopen("./utils/input_data.txt", "r");
        result_file = $fopen("./utils/cordic_results.txt", "w");
        test_file = $fopen("./utils/test.txt", "w");

        if (in_file == 0) begin
            $display("Error opening in_file.");
            $finish;
        end

        if (result_file == 0) begin
            $display("Error opening result_file.");
            $finish;
        end

        if (test_file == 0) begin
            $display("Error opening test_file.");
            $finish;
        end

        clk = 0;
        rst = 1;
        valid_in = 0;

        $dumpfile("./vcd/cordic_top_tb.vcd");
        $dumpvars(0, cordic_top_tb);

        // result_file header
        $fwrite(result_file, "%11s %11s %11s %11s %5s %11s %11s %11s %11s %11s %11s\n",
                "angle_float", "angle_int", "angle_frac", "angle_fixed", "flips",  
                "sin_fixed", "cos_fixed", "sin_float", "cos_float",
                "sim_sin_lib", "sim_cos_lib"
        );

        $fwrite(test_file, "%11s %11s %11s %11s %11s %11s %11s %11s %11s %11s %11s\n",
                "angle_real", "angle_int", "angle_frac", "angle_fixed", "flips",  
                "sin_fixed", "cos_fixed", "sin_float", "cos_float", "sin_res", "cos_res"
        );
        while (!$feof(in_file)) begin
            rst = 1;
            #10;
            rst = 0;
            #10;

            r = $fscanf(in_file, "%f %x %x %x %x %d %x %x %x %x %x %x",
                        sim_angle_real, sim_angle_float,
                        sim_angle_int, sim_angle_frac, sim_angle_fixed, sim_flips,
                        sim_sin_fixed, sim_cos_fixed,
                        sim_sin_float, sim_cos_float,
                        sim_sin_lib, sim_cos_lib
            );
            $display("\nTESTING ANGLE\t\t%f", sim_angle_real);

            #10;
            valid_in = 1;
            #10;
            valid_in = 0;
            wait (done);
            #5;

            // sin_err = sin_float - sim_sin_lib;
            // cos_err = cos_float - sim_cos_lib;
            // sin_err_acc = sin_err_acc + sin_err * sin_err;
            // cos_err_acc = cos_err_acc + cos_err * cos_err;

            // "angle_float", "angle_int", "angle_frac", "angle_fixed", "flips",  
            // "sin_fixed", "cos_fixed", "sin_float", "cos_float",
            // "sim_sin_lib", "sim_cos_lib"
            $fwrite(result_file, "%11f %11x %11x %11x %5d %11x %11x %11x %11x %11x %11x\n", // two last hex should be floats
                    sim_angle_real,
                    angle_int, angle_frac, angle_fixed, flips,
                    sin_fixed, cos_fixed,
                    sin_float, cos_float,
                    sim_sin_lib, sim_cos_lib
            );

            // "angle_real", "angle_int", "angle_frac", "angle_fixed", "flips",  
            // "sin_fixed", "cos_fixed", "sin_float", "cos_float, sin_res, cos_res"
            $fwrite(test_file, "%11f %11s %11s %11s %11s %11s %11s %11s %11s %11s %11s\n",
                sim_angle_real,
                (angle_int - sim_angle_int) < 2 ? "passed" : "failed",
                (angle_frac - sim_angle_frac) < 2 ? "passed" : "failed",
                (angle_fixed - sim_angle_fixed) < 2 ? "passed" : "failed",
                (flips - sim_flips) < 2 ? "passed" : "failed",
                `ABS_DIFF(sin_fixed, sim_sin_fixed) < 2 ? "passed" : "failed",
                `ABS_DIFF(cos_fixed, sim_cos_fixed) < 2 ? "passed" : "failed",
                `ABS_DIFF(sin_float, sim_sin_float) < 2 ? "passed" : "failed",
                `ABS_DIFF(cos_float, sim_cos_float) < 2 ? "passed" : "failed",
                `ABS_DIFF(sin_float, sim_sin_lib) < 2 ? "passed" : "failed",
                `ABS_DIFF(cos_float, sim_cos_lib) < 2 ? "passed" : "failed"
            );
        end

        // $fwrite(result_file, "Accumulated relative sin error: %f\n", sin_err_acc/360);
        // $fwrite(result_file, "Accumulated relative cos error: %f", cos_err_acc/360);
        $fclose(in_file);
        $fclose(result_file);
        $finish;
    end
endmodule
