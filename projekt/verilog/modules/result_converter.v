`timescale 1ns / 1ps

`define FIND_FIRST(IN, OUT) \
    if (IN[30]) OUT = 30; \
    else if (IN[29]) OUT = 29; \
    else if (IN[28]) OUT = 28; \
    else if (IN[27]) OUT = 27; \
    else if (IN[26]) OUT = 26; \
    else if (IN[25]) OUT = 25; \
    else if (IN[24]) OUT = 24; \
    else if (IN[23]) OUT = 23; \
    else if (IN[22]) OUT = 22; \
    else if (IN[21]) OUT = 21; \
    else if (IN[20]) OUT = 20; \
    else if (IN[19]) OUT = 19; \
    else if (IN[18]) OUT = 18; \
    else if (IN[17]) OUT = 17; \
    else if (IN[16]) OUT = 16; \
    else if (IN[15]) OUT = 15; \
    else if (IN[14]) OUT = 14; \
    else if (IN[13]) OUT = 13; \
    else if (IN[12]) OUT = 12; \
    else if (IN[11]) OUT = 11; \
    else if (IN[10]) OUT = 10; \
    else if (IN[9])  OUT = 9; \
    else if (IN[8])  OUT = 8; \
    else if (IN[7])  OUT = 7; \
    else if (IN[6])  OUT = 6; \
    else if (IN[5])  OUT = 5; \
    else if (IN[4])  OUT = 4; \
    else if (IN[3])  OUT = 3; \
    else if (IN[2])  OUT = 2; \
    else if (IN[1])  OUT = 1; \
    else if (IN[0])  OUT = 0;

module result_converter #(parameter WIDTH = 32)(
    input clk, rst,
    input signed [2:0] flips,               // value from angle_normalizer
    input signed [WIDTH-1:0] sin_in,        // value from cordic.v
    input signed [WIDTH-1:0] cos_in,        // value from cordic.v
    output reg signed [WIDTH-1:0] sin_out,  // float value passed to output
    output reg signed [WIDTH-1:0] cos_out   // float value passed to output
);

    // fixed to float conversion IN for sin_out
    reg [WIDTH-1:0] abs_sin, abs_cos;
    reg [7:0] exponent_sin, exponent_cos;
    reg [22:0] mantissa_sin, mantissa_cos;
    reg sign_sin, sign_cos;
    reg signed [6:0] shift_sin, shift_cos;  // enough to encode shift amount up to 31
    
    always@(*) begin
        case(flips)
            3'sb110: begin // -2 flips
                sin_out = -sin_in;
                if(cos_in == 32'h80000000) cos_out = cos_in;
                else                   cos_out = -cos_in;
            end
            3'sb111: begin // -1 flips
                if(cos_in == 32'h80000000) sin_out = -cos_in;
                else                   sin_out = cos_in;
                cos_out = -sin_in;
            end
            3'sb000: begin // 0 flips
                sin_out = sin_in;
                if(cos_in < 0) cos_out = -cos_in;
                else           cos_out = cos_in;
            end
            3'sb001: begin // 1 flips
                if(cos_in == 32'h80000000) sin_out = cos_in;
                else                   sin_out = -cos_in;
                cos_out = sin_in;
            end
            3'sb010: begin // 2 flips
                sin_out = -sin_in;
                if(cos_in == 32'h80000000) cos_out = cos_in;
                else                   cos_out = -cos_in;
            end
        endcase



        // sign extraction
        sign_sin = sin_out[WIDTH-1];
        abs_sin = sign_sin ? -sin_out : sin_out;

        sign_cos = cos_out[WIDTH-1];
        abs_cos = sign_cos ? -cos_out : cos_out;

        // priority encoder: find first '1' from MSB (bit 30) to LSB
        shift_sin = 0;
        shift_cos = 0;

        `FIND_FIRST(abs_sin, shift_sin)
        `FIND_FIRST(abs_cos, shift_cos)

        // exponent = shift + bias (127)
        exponent_sin = shift_sin - 31 + 127;
        exponent_cos = shift_cos - 31 + 127;

        // shift left so MSB aligns with bit 23, then drop MSB
        if(shift_cos - 23 >= 0) begin
            mantissa_sin = (abs_sin >> (shift_sin - 23)) & 32'h7FFFFF;
            mantissa_cos = (abs_cos >> (shift_cos - 23)) & 32'h7FFFFF;
        end else begin
            mantissa_sin = (abs_sin << (23 - shift_sin)) & 32'h7FFFFF;
            mantissa_cos = (abs_cos << (23 - shift_cos)) & 32'h7FFFFF;
        end
        
        // pack into IEEE 754: {sign, exponent, mantissa}
        sin_out = {sign_sin, exponent_sin, mantissa_sin[22:0]};
        cos_out = {sign_cos, exponent_cos, mantissa_cos[22:0]};
    end

endmodule
