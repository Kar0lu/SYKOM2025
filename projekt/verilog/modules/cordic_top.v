module cordic_top(
    input clk, rst, start,
    input [31:0] angle_ieee754,
    
    output [15:0] cos_q15,
    output [15:0] sin_q15,
    output valid
);
    wire signed [15:0] angle_norm;
    wire signed [2:0] flip;
    wire signed [15:0] cos_norm, sin_norm;
    wire norm_valid, cord_recived;

    angle_normalizer norm(
        .clk(clk),
        .rst(rst),
        .start(start),
        .angle_in(angle_ieee754),
        .recived(cord_recived),
        .angle_out(angle_norm),
        .flip(flip),
        .valid(norm_valid)
    );

    cordic cord(
        .clk(clk),
        .rst(rst),
        .start(norm_valid),
        .angle_in(angle_norm),
        .recived(cord_recived),
        .cos_out(cos_norm),
        .sin_out(sin_norm),
        .valid(valid)
    );

    result_converter res(
        .flip(flip),
        .cos_in(cos_norm),
        .sin_in(sin_norm),
        .cos_out(cos_q15),
        .sin_out(sin_q15)
    );
endmodule
