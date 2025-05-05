

module cordic_top(
    input clk, rst, valid_in,
    input [31:0] angle_ieee754,
    
    output [15:0] cos_ieee754,
    output [15:0] sin_ieee754,
    output [2:0] flip_out,
    output done
);
    wire signed [15:0] norm_angle;
    wire signed [2:0] flip;
    wire signed [15:0] cordic_cos, cordic_sin;
    wire norm_done, norm_ready;

    localparam WIDTH = 16;

    angle_normalizer #(.WIDTH(WIDTH)) norm(
        .clk(clk),
        .rst(rst),
        .valid_in(valid_in),
        .angle_in(angle_ieee754),
        .angle_out(norm_angle),
        .flip(flip),
        .done(norm_done),
        .ready(norm_ready)
    );

    cordic #(.WIDTH(WIDTH)) cord(
        .clk(clk),
        .rst(rst),
        .valid_in(norm_done),
        .angle_in(norm_angle),
        .cos_out(cordic_cos),
        .sin_out(cordic_sin),
        .done(done)
    );

    result_converter #(.WIDTH(WIDTH)) res(
        .flip(flip),
        .cos_in(cordic_cos),
        .sin_in(cordic_sin),
        .cos_out(cos_ieee754),
        .sin_out(sin_ieee754),
        .flip_out(flip_out)
    );
endmodule
