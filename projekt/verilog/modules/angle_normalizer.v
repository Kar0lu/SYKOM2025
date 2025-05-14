`timescale 1ns / 1ps

module angle_normalizer #(parameter WIDTH = 32)(
    input clk, rst, valid_in,                   // control signals from processor
    input [31:0] angle_in,                      // float value from processor
    output reg signed [WIDTH-1:0] angle_out,    // value passed to cordic.v
    output reg signed [2:0] flips,              // value passed to result_converter.v
    output reg done,                            // control signal to cordic.v
    output reg ready                            // control signal to processor

    `ifndef BUILD
        ,output reg signed [31:0] angle_int, angle_frac,
        output reg signed [WIDTH-1:0] angle_fixed
    `endif
);
    `ifdef BUILD
        reg signed [31:0] angle_int, angle_frac;
        reg signed [WIDTH-1:0] angle_fixed;
    `endif

    // FSM states
    reg [2:0] state;
    parameter IDLE        = 3'd0,
              EXTRACT_INT = 3'd1,
              NORM_180    = 3'd2,
              NORM_45     = 3'd3,
              CONVERT     = 3'd4,
              DONE        = 3'd5;
    reg fsm_running;

    // internal wires
    wire sign = angle_in[31];
    wire [7:0] exp_raw = angle_in[30:23];
    wire [22:0] mantissa_raw = angle_in[22:0];

    wire [23:0] mantissa = {1'b1, mantissa_raw};
    wire signed [8:0] exp_signed = {1'b0, exp_raw};
    wire signed [8:0] exp = exp_signed - 32'sd127;

    wire signed [63:0] angle_combined = (((angle_int << 32) + (angle_frac << 1)) * ((1 << 32) / 180)) >> 32;

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
                EXTRACT_INT: begin // split given float to 32 bit int and Q1.31 fraction
                    `ifdef DEBUG $display("ANGLE_NORMALIZER IN:\t\t%d %d %b", sign, exp, mantissa); `endif

                    if(exp >= 23) begin
                        angle_frac <= 0;
                        if (sign) begin
                            angle_int <= -(mantissa << (exp - 23));
                        end else begin
                            angle_int <= mantissa << (exp - 23);
                        end
                        state <= NORM_180;
                    end else if (exp >= 0) begin
                        if (sign) begin
                            angle_int <= -(mantissa >> (23 - exp));
                            angle_frac <= -((mantissa & ((1 << (23 - exp)) - 1)) << (8 + exp));
                        end else begin
                            angle_int <= mantissa >> (23 - exp);
                            angle_frac <= (mantissa & ((1 << (23 - exp)) - 1)) << (8 + exp);
                        end
                        state <= NORM_180;
                    end else begin
                        angle_int <= 0;
                        if (sign) begin
                            if (exp + 8 >= 0) begin
                                angle_frac <= -(((1 << 23) | mantissa) << (exp + 8));
                            end else if (exp + 8 >= -31) begin
                                angle_frac <= -(((1 << 23) | mantissa) >> (-exp - 8));
                            end else begin
                                angle_frac <= 0;
                            end
                        end else begin
                            if (exp + 8 >= 0) begin
                                angle_frac <= ((1 << 23) | mantissa) << (exp + 8);
                            end else if (exp + 8 >= -31) begin
                                angle_frac <= ((1 << 23) | mantissa) >> (-exp - 8);
                            end else begin
                                angle_frac <= 0;
                            end
                        end
                        state <= NORM_180;
                    end
                end
                NORM_180: begin // normalize to the range [-180, 180]
                    `ifdef DEBUG $display("ANGLE_NORMALIZER INT:\t\t%4d", angle_int); `endif
                    if      ((angle_int < -180) || (angle_int == -180 && angle_frac < 0))   angle_int <= angle_int + 360;
                    else if ((angle_int > 180) || (angle_int == 180 && angle_frac > 0))  angle_int <= angle_int - 360;
                    else                        state <= NORM_45;
                end
                NORM_45: begin  // normalize to the range [-45, 45]
                    if ((angle_int > 45) || (angle_int == 45 && angle_frac > 0)) begin
                        angle_int <= angle_int - 90;
                        flips      <= flips - 1;
                    end else if ((angle_int < -45) || (angle_int == -45 && angle_frac < 0)) begin
                        angle_int <= angle_int + 90;
                        flips      <= flips + 1;
                    end else begin
                        state <= CONVERT;
                    end
                end
                CONVERT: begin // uniform linear quantization to 32 bit signed value
                    `ifdef DEBUG $display("ANGLE_NORMALIZER NORM:\t\t%3d %d", angle_int, flips); `endif
                    angle_out <= angle_combined;
                    state     <= DONE;
                end
                DONE: begin
                    `ifdef DEBUG $display("ANGLE_NORMALIZER SEND NUMBER:\t%h %f", angle_out, angle_out/4294967296.0*180.0); `endif
                    done <= 1;
                    state <= IDLE;
                end

                default: state <= IDLE;
            endcase
        end
    end
endmodule
