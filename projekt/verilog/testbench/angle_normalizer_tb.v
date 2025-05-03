module angle_normalizer_tb;

    // Declare testbench signals
    reg clk;
    reg rst;
    reg start;
    reg [31:0] angle_in;    // IEEE 754 float input
    wire done;
    wire signed [3:0] flip;
    wire signed [15:0] angle_out; // Output

    // Instantiate the angle_normalizer module
    angle_normalizer uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .angle_in(angle_in),
        .done(done),
        .flip(flip),
        .angle_out(angle_out)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;  // 100MHz clock (10ns period)
    end

    // Task to apply a single test case
    task run_test(
        input [31:0] angle,
        input [8*30:1] label  // Allows passing string-like label
    );
    begin
        angle_in = angle;
        start = 1;
        #10
        start = 0;
        wait(done);           // Wait until done is high again
        $display("%s: angle_in = %h -> angle_out = %d, flip = %d", label, angle, angle_out, flip);
        #10;
    end
    endtask

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;
        start = 0;
        angle_in = 32'b0;

        // Reset the system
        rst = 1;
        #10;
        rst = 0;

        // Run all test cases
        run_test(32'h42340000, "Test case 1"); // 45.0
        run_test(32'h43340000, "Test case 2"); // 180.0
        run_test(32'hc3340000, "Test case 3"); // -180.0
        run_test(32'h43b40000, "Test case 4"); // 360.0
        run_test(32'hc2340000, "Test case 5"); // -45.0
        run_test(32'h41b00000, "Test case 6"); // 22.0
        run_test(32'hc1b00000, "Test case 7"); // -22.0
        run_test(32'h00000000, "Test case 8"); // 0.0

        // End of test
        $finish;
    end

endmodule
