module result_converter #( parameter WIDTH = 16 ) (
    input signed [2:0] flip,            // value from angle_normalizer
    input signed [WIDTH-1:0] sin_in,    // value from cordic.v
    input signed [WIDTH-1:0] cos_in,    // value from cordic.v
    output reg signed [WIDTH-1:0] sin_out,  // IEEE 754 value passed to output
    output reg signed [WIDTH-1:0] cos_out   // IEEE 754 value passed to output
);

    always@(*) begin
        case(flip)
            3'b100, 3'b010: begin // -2 flip or 2 flip
                sin_out = -sin_in;
                if(cos_in == 16'h8000) cos_out = cos_in;
                else                   cos_out = -cos_in;
                
            end
            3'b101: begin // -1 flip
                if(cos_in == 16'h8000) sin_out = -cos_in;
                else                   sin_out = cos_in;
                cos_out = -sin_in;
            end
            3'b001: begin // 1 flip
                if(cos_in == 16'h8000) sin_out = cos_in;
                else                   sin_out = -cos_in;
                cos_out = sin_in;
            end
            default: begin // 0 flip
                sin_out = sin_in;
                if(cos_in < 0) cos_out = -cos_in;
                else           cos_out = cos_in;
            end
        endcase
    end

endmodule
