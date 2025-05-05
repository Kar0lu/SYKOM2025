

module cordic_top(
    input clk, rst, valid_in,
    input [31:0] angle_ieee754,
    
    output [15:0] cos_q15,
    output [15:0] sin_q15,
    output valid
);
    wire signed [15:0] angle_norm;
    wire signed [2:0] flip;
    wire signed [15:0] cos_norm, sin_norm;
    wire norm_valid, cord_recived;

    localparam WIDTH = 16;

    angle_normalizer #(.WIDTH(WIDTH)) norm(
        .clk(clk),
        .rst(rst),
        .valid_in(valid_in),
        .angle_in(angle_ieee754),
        .cordic_recived(cord_recived),
        .angle_out(angle_norm),
        .flip(flip),
        .valid_out(norm_valid)
    );

    cordic #(.WIDTH(WIDTH)) cord(
        .clk(clk),
        .rst(rst),
        .valid_in(norm_valid),
        .angle_in(angle_norm),
        .cordic_recived(cord_recived),
        .cos_out(cos_norm),
        .sin_out(sin_norm),
        .valid_out(valid)
    );

    result_converter #(.WIDTH(WIDTH)) res(
        .flip(flip),
        .cos_in(cos_norm),
        .sin_in(sin_norm),
        .cos_out(cos_q15),
        .sin_out(sin_q15)
    );
endmodule
