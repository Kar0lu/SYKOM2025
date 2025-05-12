module result_converter #( parameter WIDTH = 32 ) (
    input clk, rst,
    input signed [2:0] flips,               // value from angle_normalizer
    input signed [WIDTH-1:0] sin_in,        // value from cordic.v
    input signed [WIDTH-1:0] cos_in,        // value from cordic.v
    output reg signed [WIDTH-1:0] sin_out,  // float value passed to output
    output reg signed [WIDTH-1:0] cos_out   // float value passed to output
);
    
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
    end

endmodule
