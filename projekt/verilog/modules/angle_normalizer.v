module angle_normalizer (
    input clk, rst, start, recived,     // control signals from processor
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

    // Internal registers
    reg signed [15:0] angle_int;   // working integer angle
    reg signed [15:0] angle_frac;  // fractional part of the angle
    reg is_int;

    wire sign;
    wire [7:0] exp;
    wire [23:0] mantissa;

    assign sign = angle_in[31];
    assign exp = angle_in[30:23];
    assign mantissa = {1'b1, angle_in[22:0]};

    // Extract integer and fractional part from the IEEE 754 float
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            valid <= 0;
            flip <= 0;
            angle_int <= 0;
            angle_frac <= 0;
            angle_out <= 0;
            fsm_running <= 0;
            is_int <= 0;
        end else begin
            if (start && state == IDLE) begin
                fsm_running <= 1;
            end

            if(recived) begin
                valid <= 0;
            end

            if (fsm_running) begin
                case (state)
                    IDLE: begin
                        $display("%t\tIDLE\t\tsign = %h\texp = %d\tmantissa = %b", $time, sign, exp-127, mantissa);
                        valid <= 0;
                        flip <= 0;
                        state <= EXTRACT_INT;
                    end
                    EXTRACT_INT: begin
                        $display("%t\tEXTRACT_INT", $time);
                        if (exp != 8'b0) begin
                            // Normalize the mantissa and shift based on the exponent
                            angle_int <= mantissa >> (23 - exp + 127);  // Apply exponent bias
                            angle_frac <= (mantissa >> (7 - exp + 127)) & 16'hFFFF; // Take the lower 16 bits for fractional part
                            is_int <= (((mantissa >> (7 - exp + 127)) & 16'hFFFF) == 16'h0000) ? 1 : 0;
                        end else begin
                            // Handle denormals (very small numbers)
                            angle_int <= 0;
                            angle_frac <= 0;
                        end

                        // If the sign bit is 1, make the integer part negative
                        if (sign) begin
                            angle_int <= -angle_int;
                        end
                        
                        state <= NORM_180;
                    end
                    NORM_180: begin
                        $display("%t\tNORM_180\tangle_int = %d\tangle_frac = %b", $time, angle_int, angle_frac);
                        if (angle_int > 180) begin
                            angle_int <= angle_int - 360;
                        end else if (angle_int < -180) begin
                            angle_int <= angle_int + 360;
                        end else begin
                            state <= NORM_45;
                        end
                    end
                    NORM_45: begin
                        $display("%t\tNORM_45\t\tangle_int = %d %b\tangle_frac = %b", $time, angle_int, angle_int, angle_frac);
                        // Normalize to the range [-45, 45]
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
                    CONVERT: begin
                        // Convert angle to the range [-45, 45] as fixed point
                        angle_out <= (angle_int << 14) / 45;
                        state <= DONE;
                    end
                    DONE: begin
                        $display("%t\tDONE\t\tangle_int = %d %b\tangle_out = %d %b", $time, angle_int, angle_int, angle_out, angle_out);
                        valid <= 1;
                        fsm_running <= 0;
                        state <= IDLE;       // Return to IDLE
                    end
                endcase
            end
        end
    end

endmodule
