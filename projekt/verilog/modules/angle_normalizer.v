`timescale 1ns / 1ps

module angle_normalizer #( parameter WIDTH = 32 ) (
    input clk, rst, valid_in,                      // control signals from processor
    input [31:0] angle_in,                      // float value from processor
    output reg signed [WIDTH-1:0] angle_out,    // value passed to cordic.v
    output reg signed [2:0] flips,               // value passed to result_converter.v
    output reg done,                        // control signal to cordic.v
    output reg ready,                        // control signal to processor

    // testing
    output reg signed [31:0] angle_int, angle_frac,
    output reg signed [WIDTH-1:0] angle_fixed
);

    // FSM states
    reg [2:0] state;
    parameter IDLE        = 3'd0,
              EXTRACT_INT = 3'd1,
              NORM_180    = 3'd2,
              NORM_45     = 3'd3,
              CONVERT     = 3'd4,
              DONE        = 3'd5;
    reg fsm_running;

    // internal registers
    reg is_int; // check if angle is integer

    // internal wires
    wire sign = angle_in[31]; // sign of angle_in
    wire [7:0] exp_raw = angle_in[30:23];  // exponent of angle_in
    wire [22:0] mantissa_raw = angle_in[22:0]; // mantissa of angle_in

    wire [23:0] mantissa = {1'b1, mantissa_raw};
    wire signed [8:0] exp_signed = {1'b0, exp_raw};
    wire signed [8:0] exp = exp_signed - 32'sd127;

    // FSM
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state     <= IDLE;
            flips      <= 0;
            angle_out <= 0;
            done <= 0;
        end else begin
            case (state)
                IDLE: begin
                    ready <= 1;
                    if (valid_in) begin
                        ready <= 0;
                        state <= EXTRACT_INT;
                    end
                end
                EXTRACT_INT: begin // split angle from IEEE754 to integer and fractional part
                    $display("ANGLE_NORMALIZER IN:\t\t%d %d %b", sign, exp, mantissa);

                    if(exp_raw == 0 || exp_raw == 255) begin
                        angle_out <= 0;
                        flips <= 0;
                        state <= DONE;
                    end else begin
                        angle_frac  <= (mantissa << exp) & 24'h7FFFFF;
                        is_int      <= ((mantissa << exp) & 24'h7FFFFF) == 24'h000000 ? 1 : 0;

                        if (sign) angle_int <= -(mantissa >> (23 - exp));
                        else      angle_int <= mantissa >> (23 - exp);

                        state <= NORM_180;
                    end
                    
                    
                end
                NORM_180: begin
                    $display("ANGLE_NORMALIZER INT:\t\t%4d", angle_int);
                    if      (angle_int > 180)   angle_int <= angle_int - 360;
                    else if (angle_int < -180)  angle_int <= angle_int + 360;
                    else                        state <= NORM_45;
                end
                NORM_45: begin  // normalize to the range [-45, 45]
                    if (angle_int > 45) begin
                        angle_int <= angle_int - 90;
                        flips      <= flips - 1;
                    end else if (angle_int < -45) begin
                        angle_int <= angle_int + 90;
                        flips      <= flips + 1;
                    end else begin
                        state <= CONVERT;
                    end
                end
                CONVERT: begin // uniform linear quantization to 16bit signed value
                    $display("ANGLE_NORMALIZER NORM:\t\t%3d %d", angle_int, flips);
                    angle_out <= (angle_int <<< WIDTH-2) / 45;
                    state     <= DONE;
                end
                DONE: begin
                    $display("ANGLE_NORMALIZER SEND NUMBER:\t%h %f", angle_out, angle_out/4294967296.0*180.0);
                    done <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end

endmodule
