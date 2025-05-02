module simple_register (
    input clk,
    input [15:0] data_in,
    output reg [15:0] data_out,
    input valid_in,
    output reg valid_out
);
    always @(posedge clk) begin
        if (valid_in) begin
            data_out <= data_in;
            valid_out <= 1;
        end else begin
            valid_out <= 0;
        end
    end
endmodule
