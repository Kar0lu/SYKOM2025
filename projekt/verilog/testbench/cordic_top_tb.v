`timescale 1ns / 1ps

// macro for calculating absolute difference between two value
`define ABS_DIFF(a, b) ((a > b) ? (a - b) : (b - a))

// macro for calculating how many out of 32 bits are the same between two numbers
`define COUNT_BITS(a, b) \
((a[0] == b[0]) + (a[1] == b[1]) + (a[2] == b[2]) + (a[3] == b[3]) + \
    (a[4] == b[4]) + (a[5] == b[5]) + (a[6] == b[6]) + (a[7] == b[7]) + \
    (a[8] == b[8]) + (a[9] == b[9]) + (a[10] == b[10]) + (a[11] == b[11]) + \
    (a[12] == b[12]) + (a[13] == b[13]) + (a[14] == b[14]) + (a[15] == b[15]) + \
    (a[16] == b[16]) + (a[17] == b[17]) + (a[18] == b[18]) + (a[19] == b[19]) + \
    (a[20] == b[20]) + (a[21] == b[21]) + (a[22] == b[22]) + (a[23] == b[23]) + \
    (a[24] == b[24]) + (a[25] == b[25]) + (a[26] == b[26]) + (a[27] == b[27]) + \
    (a[28] == b[28]) + (a[29] == b[29]) + (a[30] == b[30]) + (a[31] == b[31]))

module cordic_top_tb;

    // precision of cordic algorythm
    parameter WIDTH = 32;
    
    // simulation variables
    real sim_angle_real, sim_sin_lib, sim_cos_lib;
    reg [31:0] sim_angle_int, sim_angle_frac;
    reg [WIDTH-1: 0] sim_angle_fixed, sim_sin_fixed, sim_cos_fixed, sim_sin_float, sim_cos_float;
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
        
    cordic_top #(
        .WIDTH(WIDTH)
    ) dut (
        .clk(clk),
        .rst(rst),
        .valid_in(valid_in),
        .angle_float(sim_angle_float),
        .cos_float(cos_float),
        .sin_float(sin_float),
        .done(done)
        
        `ifndef BUILD
            ,.flips(flips),
            .angle_int(angle_int),
            .angle_frac(angle_frac),
            .angle_fixed(angle_fixed),
            .sin_fixed(sin_fixed),
            .cos_fixed(cos_fixed)
        `endif
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

        // test_file header
        $fwrite(test_file, "%11s %11s %11s %11s %11s %11s %11s %11s %11s\n",
                "angle_real", "angle_int", "angle_frac", "angle_fixed", "flips",  
                "sin_fixed", "cos_fixed", "sin_float", "cos_float"
        );
        while (!$feof(in_file)) begin
            rst = 1;
            #10;
            rst = 0;
            #10;

            // reading testbench data from input_data.txt
            r = $fscanf(in_file, "%f %x %x %x %x %d %x %x %x %x %f %f",
                sim_angle_real, sim_angle_float,
                sim_angle_int, sim_angle_frac, sim_angle_fixed, sim_flips,
                sim_sin_fixed, sim_cos_fixed,
                sim_sin_float, sim_cos_float,
                sim_sin_lib, sim_cos_lib
            );

            `ifdef DEBUG $display("\nTESTING ANGLE\t\t%f", sim_angle_real); `endif

            #10;
            valid_in = 1;
            #10;
            valid_in = 0;
            wait (done);
            #5;

            // "angle_float", "angle_int", "angle_frac", "angle_fixed", "flips",  
            // "sin_fixed", "cos_fixed", "sin_float", "cos_float",
            // "sim_sin_lib", "sim_cos_lib"
            // writing testbench results to cordic_results.txt
            $fwrite(result_file, "%11f %11x %11x %11x %5d %11x %11x %11x %11x %11f %11f\n",
                sim_angle_real,
                angle_int, angle_frac, angle_fixed, flips,
                sin_fixed, cos_fixed,
                sin_float, cos_float,
                sim_sin_lib, sim_cos_lib
            );

            // "angle_real", "angle_int", "angle_frac", "angle_fixed", "flips",  
            // "sin_fixed", "cos_fixed", "sin_float", "cos_float"
            // writing testbench results to test.txt
            $fwrite(test_file, "%11f %11s %11s %11s %11s %11s %11s %11s %11s\n",
                sim_angle_real,
                (angle_int - sim_angle_int) < 2 ? "passed" : "failed",
                (angle_frac - sim_angle_frac) < 2 ? "passed" : "failed",
                (angle_fixed - sim_angle_fixed) < 2 ? "passed" : "failed",
                (flips - sim_flips) < 2 ? "passed" : "failed",
                `ABS_DIFF(sin_fixed, sim_sin_fixed) < 8 ? "passed" : "failed",
                `ABS_DIFF(cos_fixed, sim_cos_fixed) < 8 ? "passed" : "failed",
                (`COUNT_BITS(sin_float, sim_sin_float) > 28 || `ABS_DIFF(sin_float, sim_sin_float) < 8)? "passed" : "failed",
                (`COUNT_BITS(cos_float, sim_cos_float) > 28 || `ABS_DIFF(cos_float, sim_cos_float) < 8) ? "passed" : "failed",
            );
        end

        $fclose(in_file);
        $fclose(result_file);
        $finish;
    end
endmodule
