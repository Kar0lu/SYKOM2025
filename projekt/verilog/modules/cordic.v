module cordic #( parameter WIDTH = 16 ) (
    input clk, rst,                                 // control signals from processor
    input valid_in,                                 // control signal from angle_normalizer
    input signed [WIDTH-1:0] angle_in,              // quantized angle from angle_normalizer
    output reg signed [WIDTH-1:0] cos_out, sin_out, // value passed to result_converter
    output reg done                           // control signal passed to result_converter
);

    // FSM states
    reg [2:0] state;
    parameter IDLE     = 3'd0,
              INIT     = 3'd1,
              CHECK    = 3'd2,
              ROTATE   = 3'd3,
              DONE     = 3'd4;
    
    // internal registers
    reg signed [WIDTH-1:0] cos_next;
    reg signed [WIDTH-1:0] phi;
    reg [6:0] i;

    // arctangent lookup table
    reg signed [15:0] atantable [0:WIDTH-1];
    initial begin
        atantable[0]  = 16'h4000;
        atantable[1]  = 16'h25C8;
        atantable[2]  = 16'h13F6;
        atantable[3]  = 16'h0A22;
        atantable[4]  = 16'h0516;
        atantable[5]  = 16'h028B;
        atantable[6]  = 16'h0145;
        atantable[7]  = 16'h00A2;
        atantable[8]  = 16'h0051;
        atantable[9]  = 16'h0029;
        atantable[10] = 16'h0014;
        atantable[11] = 16'h000A;
        atantable[12] = 16'h0005;
        atantable[13] = 16'h0003;
        atantable[14] = 16'h0002;
        atantable[15] = 16'h0001;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state           <= IDLE;
            cos_next        <= 0;
            phi             <= 0;
            i               <= 0;
            cos_out         <= 0;
            sin_out         <= 0;
            done       <= 0;
        end else begin
            case (state)
                IDLE: begin
                    done <= 0;
                    if (valid_in) begin
                        $display("CORDIC RECIVED NUMBER:\t\t%h", angle_in);
                        if (angle_in == 16'h4000) begin
                            sin_out <= 16'h5A82;
                            cos_out <= 16'h5A82;
                            state   <= DONE;
                        end else if (angle_in == 16'h0000) begin
                            sin_out <= 16'h0000;
                            cos_out <= 16'h8000;
                            state   <= DONE;
                        end else begin
                            state <= INIT;
                        end
                    end
                end

                INIT: begin
                    sin_out        <= 16'h0000;   // sin = 0
                    cos_out        <= 16'h4DBA;   // cos = scaling factor
                    cos_next       <= 0;
                    phi            <= 0;
                    i              <= 0;
                    state          <= CHECK;
                end

                CHECK: begin
                    if (i < WIDTH) begin
                        state <= ROTATE;
                    end else begin
                        state <= DONE;
                    end
                end

                ROTATE: begin
                    if (phi < angle_in) begin
                        cos_out  <= cos_out - (sin_out >>> i);
                        sin_out  <= sin_out + (cos_out >>> i);
                        phi      <= phi + atantable[i];
                    end else begin
                        cos_out  <= cos_out + (sin_out >>> i);
                        sin_out  <= sin_out - (cos_out >>> i);
                        phi      <= phi - atantable[i];
                    end
                    i     <= i + 1;
                    state <= CHECK;
                end

                DONE: begin
                    $display("CORDIC COMPUTED:\t\t%h %h", sin_out, cos_out);
                    done      <= 1;
                    if (!valid_in) state <= IDLE;
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule
