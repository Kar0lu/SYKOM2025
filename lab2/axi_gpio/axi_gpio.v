module axi_gpio #(
    parameter ADDR_LSB = 2,
    parameter OPT_MEM_ADDR_BITS = 2  // dla 3 rejestrów: 0x00, 0x04, 0x08
)(
    // Global signals
    input wire S_AXI_ACLK,
    input wire S_AXI_ARESETN,

    // AXI4-Lite slave interface

    // Write address channel
    input  wire [31:0] S_AXI_AWADDR,    // Write address
    input  wire        S_AXI_AWVALID,   // Write address valid
    output wire        S_AXI_AWREADY,   // Write address ready (slave is ready for address and control signals)

    // Write data channel
    input  wire [31:0] S_AXI_WDATA,     // Write data
    input  wire [3:0]  S_AXI_WSTRB,     // Strobe (which bytes are valid)
    input  wire        S_AXI_WVALID,    // Write data valid
    output wire        S_AXI_WREADY,    // Write data ready (slave is ready for data)

    // Write response channel
    input  wire        S_AXI_BREADY,    // Response ready (Master can accept the response)
    output wire [1:0]  S_AXI_BRESP,     // Write response
    output wire        S_AXI_BVALID,    // Write response valid
    

    // Read
    input  wire [31:0] S_AXI_ARADDR,
    input  wire        S_AXI_ARVALID,
    output wire        S_AXI_ARREADY,
    output wire [31:0] S_AXI_RDATA,
    output wire [1:0]  S_AXI_RRESP,
    output wire        S_AXI_RVALID,
    input  wire        S_AXI_RREADY,

    // To module
    output wire [15:0] mod_in,
    input  wire [15:0] mod_out_a,
    input  wire [15:0] mod_out_b
);

    // --------------------------------------------
    // Rejestry
    // --------------------------------------------
    reg [15:0] reg_input;

    wire slv_reg_wren;
    reg  aw_en;

    reg axi_awready, axi_wready, axi_bvalid;
    reg [1:0] axi_bresp;
    reg axi_arready, axi_rvalid;
    reg [1:0] axi_rresp;
    reg [31:0] axi_rdata;
    reg [31:0] axi_awaddr, axi_araddr;

    assign S_AXI_AWREADY = axi_awready;
    assign S_AXI_WREADY  = axi_wready;
    assign S_AXI_BRESP   = axi_bresp;
    assign S_AXI_BVALID  = axi_bvalid;
    assign S_AXI_ARREADY = axi_arready;
    assign S_AXI_RDATA   = axi_rdata;
    assign S_AXI_RRESP   = axi_rresp;
    assign S_AXI_RVALID  = axi_rvalid;

    // --------------------------------------------
    // Logika zapisu
    // --------------------------------------------
    assign slv_reg_wren = S_AXI_WVALID && axi_wready && S_AXI_AWVALID && axi_awready;

    always @(posedge S_AXI_ACLK) begin
        if (!S_AXI_ARESETN) begin
            reg_input <= 16'h0000;
        end else if (slv_reg_wren) begin
            case (axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB])
                2'b00: reg_input <= S_AXI_WDATA[15:0];
                default:;
            endcase
        end
    end

    // Write response logic
    always @(posedge S_AXI_ACLK) begin
        if (!S_AXI_ARESETN) begin
            axi_awready <= 1'b0;
            axi_wready  <= 1'b0;
            axi_bvalid  <= 1'b0;
            axi_bresp   <= 2'b00;
        end else begin
            if (!axi_awready && S_AXI_AWVALID && S_AXI_WVALID) begin
                axi_awready <= 1'b1;
                axi_wready  <= 1'b1;
            end else begin
                axi_awready <= 1'b0;
                axi_wready  <= 1'b0;
            end

            if (slv_reg_wren && !axi_bvalid) begin
                axi_bvalid <= 1'b1;
                axi_bresp  <= 2'b00;
            end else if (S_AXI_BREADY && axi_bvalid) begin
                axi_bvalid <= 1'b0;
            end
        end
    end

    // --------------------------------------------
    // Logika odczytu
    // --------------------------------------------
    always @(posedge S_AXI_ACLK) begin
        if (!S_AXI_ARESETN) begin
            axi_arready <= 1'b0;
            axi_rvalid  <= 1'b0;
            axi_rresp   <= 2'b00;
            axi_rdata   <= 32'h00000000;
        end else begin
            if (!axi_arready && S_AXI_ARVALID) begin
                axi_arready <= 1'b1;
                axi_araddr  <= S_AXI_ARADDR;
            end else begin
                axi_arready <= 1'b0;
            end

            if (axi_arready && S_AXI_ARVALID && !axi_rvalid) begin
                axi_rvalid <= 1'b1;
                axi_rresp  <= 2'b00;
                case (S_AXI_ARADDR[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB])
                    2'b00: axi_rdata <= {16'h0, reg_input};     // 0x00
                    2'b01: axi_rdata <= {16'h0, mod_out_a};     // 0x04
                    2'b10: axi_rdata <= {16'h0, mod_out_b};     // 0x08
                    default: axi_rdata <= 32'hDEADBEEF;
                endcase
            end else if (axi_rvalid && S_AXI_RREADY) begin
                axi_rvalid <= 1'b0;
            end
        end
    end

    // --------------------------------------------
    // Połączenie z Twoim modułem
    // --------------------------------------------
    assign mod_in = reg_input;

endmodule
