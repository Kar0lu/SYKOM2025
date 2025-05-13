module result_converter #( parameter WIDTH = 32 ) (
    input clk, rst,
    input signed [2:0] flips,               // value from angle_normalizer
    input signed [WIDTH-1:0] sin_in,        // value from cordic.v
    input signed [WIDTH-1:0] cos_in,        // value from cordic.v
    output reg signed [WIDTH-1:0] sin_out,  // float value passed to output
    output reg signed [WIDTH-1:0] cos_out   // float value passed to output
);

    // Fixed to float conversion logic for sin_out
    reg [WIDTH-1:0] abs_sin, abs_cos;
        reg [7:0] exponent_sin, exponent_cos;
        reg [22:0] mantissa_sin, mantissa_cos;
        reg sign_sin, sign_cos;
        reg signed [6:0] shift_sin, shift_cos;  // Enough to encode shift amount up to 31
    
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



        // Sign extraction
        sign_sin = sin_out[WIDTH-1];
        abs_sin = sign_sin ? -sin_out : sin_out;

        sign_cos = cos_out[WIDTH-1];
        abs_cos = sign_cos ? -cos_out : cos_out;

        // Priority encoder: find first '1' from MSB (bit 30) to LSB
        shift_sin = 0;
        shift_cos = 0;

        if (abs_sin[30]) shift_sin = 30;
        else if (abs_sin[29]) shift_sin = 29;
        else if (abs_sin[28]) shift_sin = 28;
        else if (abs_sin[27]) shift_sin = 27;
        else if (abs_sin[26]) shift_sin = 26;
        else if (abs_sin[25]) shift_sin = 25;
        else if (abs_sin[24]) shift_sin = 24;
        else if (abs_sin[23]) shift_sin = 23;
        else if (abs_sin[22]) shift_sin = 22;
        else if (abs_sin[21]) shift_sin = 21;
        else if (abs_sin[20]) shift_sin = 20;
        else if (abs_sin[19]) shift_sin = 19;
        else if (abs_sin[18]) shift_sin = 18;
        else if (abs_sin[17]) shift_sin = 17;
        else if (abs_sin[16]) shift_sin = 16;
        else if (abs_sin[15]) shift_sin = 15;
        else if (abs_sin[14]) shift_sin = 14;
        else if (abs_sin[13]) shift_sin = 13;
        else if (abs_sin[12]) shift_sin = 12;
        else if (abs_sin[11]) shift_sin = 11;
        else if (abs_sin[10]) shift_sin = 10;
        else if (abs_sin[9])  shift_sin = 9;
        else if (abs_sin[8])  shift_sin = 8;
        else if (abs_sin[7])  shift_sin = 7;
        else if (abs_sin[6])  shift_sin = 6;
        else if (abs_sin[5])  shift_sin = 5;
        else if (abs_sin[4])  shift_sin = 4;
        else if (abs_sin[3])  shift_sin = 3;
        else if (abs_sin[2])  shift_sin = 2;
        else if (abs_sin[1])  shift_sin = 1;
        else if (abs_sin[0])  shift_sin = 0;

        if (abs_cos[30]) shift_cos = 30;
        else if (abs_cos[29]) shift_cos = 29;
        else if (abs_cos[28]) shift_cos = 28;
        else if (abs_cos[27]) shift_cos = 27;
        else if (abs_cos[26]) shift_cos = 26;
        else if (abs_cos[25]) shift_cos = 25;
        else if (abs_cos[24]) shift_cos = 24;
        else if (abs_cos[23]) shift_cos = 23;
        else if (abs_cos[22]) shift_cos = 22;
        else if (abs_cos[21]) shift_cos = 21;
        else if (abs_cos[20]) shift_cos = 20;
        else if (abs_cos[19]) shift_cos = 19;
        else if (abs_cos[18]) shift_cos = 18;
        else if (abs_cos[17]) shift_cos = 17;
        else if (abs_cos[16]) shift_cos = 16;
        else if (abs_cos[15]) shift_cos = 15;
        else if (abs_cos[14]) shift_cos = 14;
        else if (abs_cos[13]) shift_cos = 13;
        else if (abs_cos[12]) shift_cos = 12;
        else if (abs_cos[11]) shift_cos = 11;
        else if (abs_cos[10]) shift_cos = 10;
        else if (abs_cos[9])  shift_cos = 9;
        else if (abs_cos[8])  shift_cos = 8;
        else if (abs_cos[7])  shift_cos = 7;
        else if (abs_cos[6])  shift_cos = 6;
        else if (abs_cos[5])  shift_cos = 5;
        else if (abs_cos[4])  shift_cos = 4;
        else if (abs_cos[3])  shift_cos = 3;
        else if (abs_cos[2])  shift_cos = 2;
        else if (abs_cos[1])  shift_cos = 1;
        else if (abs_cos[0])  shift_cos = 0;

        // Exponent = shift + bias (127)
        exponent_sin = shift_sin - 31 + 127;
        exponent_cos = shift_cos - 31 + 127;

        // Shift left so MSB aligns with bit 23, then drop MSB
        if(shift_cos - 23 >= 0) begin
            mantissa_sin = (abs_sin >> (shift_sin - 23)) & 32'h7FFFFF;
            mantissa_cos = (abs_cos >> (shift_cos - 23)) & 32'h7FFFFF;
        end else begin
            mantissa_sin = (abs_sin << (23 - shift_sin)) & 32'h7FFFFF;
            mantissa_cos = (abs_cos << (23 - shift_cos)) & 32'h7FFFFF;
        end
        

        // Pack into IEEE 754: {sign, exponent, mantissa}
        sin_out = {sign_sin, exponent_sin, mantissa_sin[22:0]};
        cos_out = {sign_cos, exponent_cos, mantissa_cos[22:0]};

    end

endmodule
