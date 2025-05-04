module cordic (
    input clk, rst, start,
    input signed [15:0] angle_in,         // normalized angle
    output reg signed [15:0] cos_out, sin_out,
    output reg valid, recived
);

    parameter NUMBER_OF_ITERATIONS = 16;

    // FSM states
    parameter IDLE     = 3'd0,
              INIT     = 3'd1,
              CHECK    = 3'd2,
              ROTATE   = 3'd3,
              DONE     = 3'd4;

    reg [2:0] state;
    reg signed [15:0] cos_next;
    reg signed [15:0] phi;
    reg [5:0] i;

    // Arctangent lookup table
    reg signed [15:0] atantable [0:NUMBER_OF_ITERATIONS-1];

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
            state   <= IDLE;
            cos_out <= 0;
            sin_out <= 0;
            cos_next <= 0;
            phi     <= 0;
            i       <= 0;
            valid   <= 0;
            recived <= 0;
        end else begin
            case (state)
                IDLE: begin
                    valid <= 0;
                    if (start) begin
                        recived <= 1;
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
                    sin_out <= 16'h0000;   // sin = 0
                    cos_out <= 16'h4DBA;   // cos = scaling factor
                    cos_next <= 0;
                    phi     <= 0;
                    i       <= 0;
                    state   <= CHECK;
                    recived <= 0;
                end

                CHECK: begin
                    if (i < NUMBER_OF_ITERATIONS) begin
                        state <= ROTATE;
                    end else begin
                        state <= DONE;
                    end
                end

                ROTATE: begin
                    if (phi < angle_in) begin
                        cos_out <= cos_out - (sin_out >>> i);
                        sin_out  <= sin_out + (cos_out >>> i);
                        // cos_out  <= cos_next;
                        phi      <= phi + atantable[i];
                    end else begin
                        cos_out <= cos_out + (sin_out >>> i);
                        sin_out  <= sin_out - (cos_out >>> i);
                        // cos_out  <= cos_next;
                        phi      <= phi - atantable[i];
                    end
                    i     <= i + 1;
                    state <= CHECK;
                end

                DONE: begin
                    valid <= 1;
                    recived <= 0;
                    if (!start) state <= IDLE;
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule
