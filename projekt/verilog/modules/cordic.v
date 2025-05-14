`timescale 1ns / 1ps

module cordic #(parameter WIDTH = 32)(
    input clk, rst,                                 // control signals from processor
    input valid_in,                                 // control signal from angle_normalizer
    input signed [WIDTH-1:0] angle_in,              // quantized angle from angle_normalizer
    output reg signed [WIDTH-1:0] cos_out, sin_out, // value passed to result_converter
    output reg done                                 // control signal passed to result_converter
);
    localparam MAGIC_NUMBER = 32'h4DBA76D4;
    localparam FIXED_SIN_45 = 32'h5A820000;
    localparam FIXED_COS_45 = 32'h5A820000;
    localparam FIXED_45 = 32'h40000000;

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
    reg signed [WIDTH-1:0] atantable [0:WIDTH-1];

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            atantable[0]  <= 32'h40000000;
            atantable[1]  <= 32'h25C80A3B;
            atantable[2]  <= 32'h13F670B7;
            atantable[3]  <= 32'h0A2223A8;
            atantable[4]  <= 32'h05161A86;
            atantable[5]  <= 32'h028BAFC3;
            atantable[6]  <= 32'h0145EC3D;
            atantable[7]  <= 32'h00A2F8AA;
            atantable[8]  <= 32'h00517CA7;
            atantable[9]  <= 32'h0028BE5D;
            atantable[10] <= 32'h00145F30;
            atantable[11] <= 32'h000A2F98;
            atantable[12] <= 32'h000517CC;
            atantable[13] <= 32'h00028BE6;
            atantable[14] <= 32'h000145F3;
            atantable[15] <= 32'h0000A2FA;
            atantable[16] <= 32'h0000517D;
            atantable[17] <= 32'h000028BE;
            atantable[18] <= 32'h0000145F;
            atantable[19] <= 32'h00000A30;
            atantable[20] <= 32'h00000518;
            atantable[21] <= 32'h0000028C;
            atantable[22] <= 32'h00000146;
            atantable[23] <= 32'h000000A3;
            atantable[24] <= 32'h00000051;
            atantable[25] <= 32'h00000029;
            atantable[26] <= 32'h00000014;
            atantable[27] <= 32'h0000000A;
            atantable[28] <= 32'h00000005;
            atantable[29] <= 32'h00000003;
            atantable[30] <= 32'h00000001;
            atantable[31] <= 32'h00000001;

            state       <= IDLE;
            cos_next    <= 0;
            phi         <= 0;
            i           <= 0;
            cos_out     <= 0;
            sin_out     <= 0;
            done        <= 0;
            
        end else begin
            case (state)
                IDLE: begin
                    done <= 0;
                    if (valid_in) begin
                        `ifdef DEBUG $display("CORDIC RECIVED NUMBER:\t\t%h", angle_in); `endif
                        if (angle_in == FIXED_45) begin // 45 degrees
                            sin_out <= FIXED_SIN_45;
                            cos_out <= FIXED_COS_45;
                            state   <= DONE;
                        end else if (angle_in == 32'h00000000) begin // 0 degrees
                            sin_out <= 32'h00000000;
                            cos_out <= 32'h80000000;
                            state   <= DONE;
                        end else begin
                            state <= INIT;
                        end
                    end
                end

                INIT: begin
                    sin_out     <= 32'h00000000;
                    cos_out     <= MAGIC_NUMBER;
                    cos_next    <= 0;
                    phi         <= 0;
                    i           <= 0;
                    state       <= CHECK;
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
                    `ifdef DEBUG $display("CORDIC COMPUTED:\t\t%h %h", sin_out, cos_out); `endif
                    done <= 1;
                    if (!valid_in) state <= IDLE;
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule
