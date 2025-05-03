module result_converter(
    input signed [3:0] flip,           // flips corresponds to the 'flips' in C (int8)
    input signed [15:0] cos_in,        // cos_in corresponds to cos_reg in C (int16)
    input signed [15:0] sin_in,        // sin_in corresponds to sin_reg in C (int16)
    output reg signed [15:0] cos_out,  // cos_out corresponds to cos_res in C (double)
    output reg signed [15:0] sin_out   // sin_out corresponds to sin_res in C (double)
);

    always @(*) begin
        case (flip)
            3'b001: begin  // flips = 1
                cos_out = (sin_in != 16'h8000) ? -sin_in : sin_in;  // edge case for 90
                sin_out = (cos_in != 16'h8000) ? -cos_in : cos_in;  // handle negative case for 90
            end
            
            3'b111: begin  // flips = -1
                cos_out = -sin_in;  // edge case for -90
                sin_out = (cos_in != 16'h8000) ? cos_in : -cos_in;  // handle negative case for -90
            end
            
            3'b010: begin  // flips = 2
                cos_out = (cos_in != 16'h8000) ? -cos_in : cos_in;  // edge case for 180
                sin_out = -sin_in;  // edge case for 180
            end
            
            3'b110: begin  // flips = -2
                cos_out = (cos_in != 16'h8000) ? -cos_in : cos_in;  // edge case for -180
                sin_out = -sin_in;  // edge case for -180
            end
            
            default: begin  // flips = 0 (default case)
                cos_out = (cos_in < 0) ? -cos_in : cos_in;  // edge case for 0
                sin_out = sin_in;
            end
        endcase
    end

endmodule
