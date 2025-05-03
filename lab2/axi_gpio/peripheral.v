module simple_register (
    input clk,
    input wire [31:0] data_in,
    output wire [31:0] data_out,
    input wire we,
    output reg valid
);

    reg [31:0] inner_data;
    assign data_out = inner_data;

    always @(posedge clk)
    begin
        if (we) begin
            inner_data <= data_in;
            valid <= 1'b1;
        end
    end
endmodule