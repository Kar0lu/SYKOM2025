`timescale 1ns / 1ps

module cordic_top #(parameter WIDTH = 32)(
    input clk, rst, valid_in,
    input [31:0] angle_float,
    
    output [31:0] cos_float,
    output [31:0] sin_float,
    output done

    `ifndef BUILD
        ,output wire signed [2:0] flips,
        output wire signed [31:0] angle_int, angle_frac, angle_fixed,
        output wire signed [WIDTH-1: 0] sin_fixed, cos_fixed
    `endif
);
    `ifdef BUILD
        wire signed [2:0] flips;
        wire signed [31:0] angle_fixed;
        wire signed [WIDTH-1:0] sin_fixed, cos_fixed;
    `endif
    wire norm_done, norm_ready;

    angle_normalizer #(.WIDTH(WIDTH)) norm(
        .clk(clk),
        .rst(rst),
        .valid_in(valid_in),
        .angle_in(angle_float),
        .angle_out(angle_fixed),
        .flips(flips),
        .done(norm_done),
        .ready(norm_ready)
        `ifndef BUILD
            ,.angle_int(angle_int),
            .angle_frac(angle_frac)
        `endif
    );

    cordic #(.WIDTH(WIDTH)) cord(
        .clk(clk),
        .rst(rst),
        .valid_in(norm_done),
        .angle_in(angle_fixed),
        .sin_out(sin_fixed),
        .cos_out(cos_fixed),
        .done(done)
    );

    result_converter #(.WIDTH(WIDTH)) res(
        .flips(flips),
        .sin_in(sin_fixed),
        .cos_in(cos_fixed),
        .sin_out(sin_float),
        .cos_out(cos_float)
    );
endmodule
