`timescale 1ns / 1ps

module angle_normalizer (
    input clk, rst, start,              // control signals from processor
    input recived,                      // control signal from cordic.v
    input [31:0] angle_in,              // IEEE 754 float from processor
    output reg signed [2:0] flip,       // value passed to result_converter.v
    output reg signed [15:0] angle_out, // value passed to cordic.v
    output reg valid                    // control signal to cordic.v
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
    reg signed [15:0] angle_int;   // integer part of the angle
    reg signed [15:0] angle_frac;  // fractional part of the angle
    reg is_int;                    // check if angle is integer

    // internal wires
    wire sign = angle_in[31];                                   // sign of angle_in
    wire [7:0] exp_biased = angle_in[30:23];
    wire signed [8:0] exp_unbiased_temp = {1'b0, exp_biased};
    wire signed [8:0] exp = exp_unbiased_temp - 8'sd127;        // exponent of angle_in
    wire [23:0] mantissa = {1'b1, angle_in[22:0]};              // mantissa of angle_in

    // FSM
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;

            flip <= 0;
            angle_out <= 0;
            valid <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (recived) begin
                        valid <= 0;  // clear handshake
                        flip <= 0;
                    end
                    if (start) state <= EXTRACT_INT;
                end
                EXTRACT_INT: begin // split angle from IEEE754 to integer and fractional part
                    angle_int   <= mantissa >> (23 - exp);
                    angle_frac  <= (mantissa >> (7 - exp)) & 16'hFFFF;
                    is_int      <= (((mantissa >> (7 - exp)) & 16'hFFFF) == 16'h0000) ? 1 : 0;

                    if (sign) angle_int <= -angle_int;

                    state <= NORM_180;
                end
                NORM_180: begin
                    if      (angle_int > 180)   angle_int <= angle_int - 360;
                    else if (angle_int < -180)  angle_int <= angle_int + 360;
                    else                        state <= NORM_45;
                end
                NORM_45: begin  // normalize to the range [-45, 45]
                    if (angle_int > 45) begin
                        angle_int <= angle_int - 90;
                        flip <= flip - 1;
                    end else if (angle_int < -45) begin
                        angle_int <= angle_int + 90;
                        flip <= flip + 1;
                    end else begin
                        state <= CONVERT;
                    end
                end
                CONVERT: begin // uniform linear quantization to 16bit signed value
                    angle_out <= (angle_int <<< 14) / 45;
                    state <= DONE;
                end
                DONE: begin
                    valid <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end

endmodule
