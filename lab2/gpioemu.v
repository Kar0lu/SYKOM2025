module gpioemu #(
    parameter NUM_PERIPHERALS = 2,
    parameter ADDR_WIDTH = 16,
    parameter DATA_WIDTH = 16,
    parameter [ADDR_WIDTH*NUM_PERIPHERALS-1:0] ADDR_LIST = {16'h0020, 16'h0010}
)(
    input clk,
    input n_reset,
    input [ADDR_WIDTH-1:0] saddress,
    input swr,
    input srd,
    input [31:0] sdata_in,
    output reg [31:0] sdata_out,
    output wire [DATA_WIDTH-1:0] latched_data_insp,

    output reg [NUM_PERIPHERALS*DATA_WIDTH-1:0] gpio_out_flat,
    input      [NUM_PERIPHERALS*DATA_WIDTH-1:0] gpio_in_flat,
    output reg [NUM_PERIPHERALS-1:0]            valid_out,
    input      [NUM_PERIPHERALS-1:0]            valid_in
);

integer i;
reg [DATA_WIDTH-1:0] latched_data [0:NUM_PERIPHERALS-1];
wire [DATA_WIDTH-1:0] gpio_in [0:NUM_PERIPHERALS-1];
reg  [DATA_WIDTH-1:0] gpio_out [0:NUM_PERIPHERALS-1];

generate
    genvar gi;
    for (gi = 0; gi < NUM_PERIPHERALS; gi = gi + 1) begin : FLATTEN_IO
        assign gpio_in[gi] = gpio_in_flat[gi*DATA_WIDTH +: DATA_WIDTH];
        always @(*) gpio_out_flat[gi*DATA_WIDTH +: DATA_WIDTH] = gpio_out[gi];
    end
endgenerate

always @(posedge clk or negedge n_reset) begin
    if (!n_reset) begin
        for (i = 0; i < NUM_PERIPHERALS; i = i + 1) begin
            gpio_out[i]   <= 0;
            valid_out[i]  <= 0;
            latched_data[i] <= 0;
        end
        sdata_out <= 0;
    end else begin
        for (i = 0; i < NUM_PERIPHERALS; i = i + 1) begin
            valid_out[i] <= 0;

            if (valid_in[i]) begin
                latched_data[i] <= gpio_in[i];
            end

            if (saddress == ADDR_LIST[i*ADDR_WIDTH +: ADDR_WIDTH]) begin
                if (swr) begin
                    gpio_out[i] <= sdata_in[DATA_WIDTH-1:0];
                    valid_out[i] <= 1;
                end else if (srd) begin
                    sdata_out <= { {(32 - DATA_WIDTH){1'b0}}, latched_data[i] };
                    valid_out[i] <= 1;
                end else begin
                    sdata_out <= 32'd0;
                end
            end
        end
    end
end

assign latched_data_insp = latched_data[0];

endmodule