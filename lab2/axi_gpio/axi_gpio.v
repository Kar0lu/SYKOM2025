module axi_gpio #(
    parameter ADDR_WIDTH = 5  // 5 registers: 0x00, 0x04, 0x08, 0x12, 0x16 (up to 8)
)(
    // To module
    output wire [31:0] slv_reg0_out,
    output wire slv_reg0_we_out,
    input  wire [31:0] slv_reg0_in,
    input wire slv_reg0_valid,

    output wire [31:0] slv_reg1_out,
    output wire slv_reg1_we_out,
    input  wire [31:0] slv_reg1_in,
    input wire slv_reg1_valid,

    output wire [31:0] slv_reg2_out,
    output wire slv_reg2_we_out,
    input  wire [31:0] slv_reg2_in,
    input wire slv_reg2_valid,

    output wire [31:0] slv_reg3_out,
    output wire slv_reg3_we_out,
    input  wire [31:0] slv_reg3_in,
    input wire slv_reg3_valid,

    output wire [31:0] slv_reg4_out,
    output wire slv_reg4_we_out,
    input  wire [31:0] slv_reg4_in,
    input wire slv_reg4_valid,

    // Global signals
    input wire S_AXI_ACLK,
    input wire S_AXI_ARESETN,

    // AXI4-Lite slave interface

    // Write address channel
    input  wire [ADDR_WIDTH-1:0] S_AXI_AWADDR,      // Write address
    input  wire        S_AXI_AWVALID,               // Write address valid
    output wire        S_AXI_AWREADY,               // Write address ready (slave is ready for address)

    // Write data channel
    input  wire [31:0] S_AXI_WDATA,                 // Write data
    input  wire [3:0]  S_AXI_WSTRB,                 // Strobe (which bytes are valid)
    input  wire        S_AXI_WVALID,                // Write data valid
    output wire        S_AXI_WREADY,                // Write data ready (slave is ready for data)

    // Write response channel
    input  wire        S_AXI_BREADY,                // Response ready (Master can accept the response)
    output wire [1:0]  S_AXI_BRESP,                 // Write response
    output wire        S_AXI_BVALID,                // Write response valid
    
    // Read address channel
    input  wire [ADDR_WIDTH-1:0] S_AXI_ARADDR,      // Read address
    input  wire        S_AXI_ARVALID,               // Read address valid
    output wire        S_AXI_ARREADY,               // Read address ready (slave is ready for address)

    // Read data channel
    output wire [31:0] S_AXI_RDATA,                 // Read data
    output wire [1:0]  S_AXI_RRESP,                 // Read response
    output wire        S_AXI_RVALID,                // Read valid (data on bus is valid)
    input  wire        S_AXI_RREADY                 // Read ready (master can read from bus)
);

    localparam ADDR_LSB = 2;     // Each address is 32-bit (so 4 bytes)

    // Registers

    reg axi_awready, axi_wready, axi_bvalid,        // Write signals
        axi_arready, axi_rvalid;                    // Read signals

    reg [1:0] axi_bresp,                            // Write response
              axi_rresp;                            // Read response

    reg [ADDR_WIDTH-1:0] axi_awaddr,                // Write address
                         axi_araddr;                // Read address

    // Assaigning control registers to output
    assign S_AXI_AWREADY = axi_awready;
    assign S_AXI_WREADY  = axi_wready;
    assign S_AXI_BVALID  = axi_bvalid;

    // Responses: 00 (OKAY), 01 (EXOKAY), 10 (SLVERR), 11 (DECERR)
    assign S_AXI_BRESP   = axi_bresp;
    assign S_AXI_RRESP   = axi_rresp;

    assign S_AXI_ARREADY = axi_arready;
    assign S_AXI_RVALID  = axi_rvalid;

    // Slave regs                          Valid for lab3/proj (for lab2 all are RW)
    reg [31:0]  slv_reg0,                  // WO control reg
                slv_reg1,                  // RO control reg
                slv_reg2,                  // WO input req
                slv_reg3,                  // RO output reg
                slv_reg4;                  // RO output reg

    // External registers write enables
    reg slv_reg0_we_reg,
        slv_reg1_we_reg,
        slv_reg2_we_reg,
        slv_reg3_we_reg,
        slv_reg4_we_reg;

    // State machine varible
	reg [1:0] state_read;

	// State machine local parameters
	localparam Idle = 2'b00, Raddr = 2'b10, Rdata = 2'b11;

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

            if (S_AXI_WVALID && S_AXI_AWVALID && !axi_bvalid) begin
                axi_bvalid <= 1'b1;
                axi_bresp  <= 2'b00;
            end else if (S_AXI_BREADY && axi_bvalid) begin
                axi_bvalid <= 1'b0;
            end
        end
    end

    // Write operation
    always @( posedge S_AXI_ACLK )
	begin
        if (!S_AXI_ARESETN)
        begin
            slv_reg0 <= 0;
            slv_reg1 <= 0;
            slv_reg2 <= 0;
            slv_reg3 <= 0;
            slv_reg4 <= 0;
        end 
        else begin
        // If address and data are valid
        if (S_AXI_WVALID && S_AXI_AWVALID)
            case ( (S_AXI_AWVALID) ? S_AXI_AWADDR[ADDR_LSB+2:ADDR_LSB] : axi_awaddr[ADDR_LSB+2:ADDR_LSB] )
                3'h0: 
                begin
                    slv_reg0_we_reg <= 1'b1;
                    if ( S_AXI_WSTRB[0] == 1 ) slv_reg0[0 +: 8] <= S_AXI_WDATA[0 +: 8];
                    if ( S_AXI_WSTRB[1] == 1 ) slv_reg0[8 +: 8] <= S_AXI_WDATA[8 +: 8];
                    if ( S_AXI_WSTRB[2] == 1 ) slv_reg0[16 +: 8] <= S_AXI_WDATA[16 +: 8];
                    if ( S_AXI_WSTRB[3] == 1 ) slv_reg0[24 +: 8] <= S_AXI_WDATA[24 +: 8];
                end
                3'h1: begin
                    slv_reg1_we_reg <= 1'b1;
                    if ( S_AXI_WSTRB[0] == 1 ) slv_reg1[0 +: 8] <= S_AXI_WDATA[0 +: 8];
                    if ( S_AXI_WSTRB[1] == 1 ) slv_reg1[8 +: 8] <= S_AXI_WDATA[8 +: 8];
                    if ( S_AXI_WSTRB[2] == 1 ) slv_reg1[16 +: 8] <= S_AXI_WDATA[16 +: 8];
                    if ( S_AXI_WSTRB[3] == 1 ) slv_reg1[24 +: 8] <= S_AXI_WDATA[24 +: 8];
                end
                3'h2: begin
                    slv_reg2_we_reg <= 1'b1;
                    if ( S_AXI_WSTRB[0] == 1 ) slv_reg2[0 +: 8] <= S_AXI_WDATA[0 +: 8];
                    if ( S_AXI_WSTRB[1] == 1 ) slv_reg2[8 +: 8] <= S_AXI_WDATA[8 +: 8];
                    if ( S_AXI_WSTRB[2] == 1 ) slv_reg2[16 +: 8] <= S_AXI_WDATA[16 +: 8];
                    if ( S_AXI_WSTRB[3] == 1 ) slv_reg2[24 +: 8] <= S_AXI_WDATA[24 +: 8];
                end
                3'h3: begin
                    slv_reg3_we_reg <= 1'b1;
                    if ( S_AXI_WSTRB[0] == 1 ) slv_reg3[0 +: 8] <= S_AXI_WDATA[0 +: 8];
                    if ( S_AXI_WSTRB[1] == 1 ) slv_reg3[8 +: 8] <= S_AXI_WDATA[8 +: 8];
                    if ( S_AXI_WSTRB[2] == 1 ) slv_reg3[16 +: 8] <= S_AXI_WDATA[16 +: 8];
                    if ( S_AXI_WSTRB[3] == 1 ) slv_reg3[24 +: 8] <= S_AXI_WDATA[24 +: 8];
                end
                3'h4: 
                begin
                    slv_reg4_we_reg <= 1'b1;
                    if ( S_AXI_WSTRB[0] == 1 ) slv_reg4[0 +: 8] <= S_AXI_WDATA[0 +: 8];
                    if ( S_AXI_WSTRB[1] == 1 ) slv_reg4[8 +: 8] <= S_AXI_WDATA[8 +: 8];
                    if ( S_AXI_WSTRB[2] == 1 ) slv_reg4[16 +: 8] <= S_AXI_WDATA[16 +: 8];
                    if ( S_AXI_WSTRB[3] == 1 ) slv_reg4[24 +: 8] <= S_AXI_WDATA[24 +: 8];
                end
                default : begin
                            slv_reg0 <= slv_reg0;
                            slv_reg1 <= slv_reg1;
                            slv_reg2 <= slv_reg2;
                            slv_reg3 <= slv_reg3;
                            slv_reg4 <= slv_reg4;
                        end
            endcase
        end
	end

    // Read state machine
    always @(posedge S_AXI_ACLK)
	    begin
	      if (!S_AXI_ARESETN)
	        begin
                axi_arready <= 1'b0;
                axi_rvalid <= 1'b0;
                axi_rresp <= 2'b00;
                state_read <= Idle;
	        end
	      else
	        begin
	          case(state_read)
	            Idle:
	              begin
                    // Reset done, move on to ready for address (Raddr)
	                if (S_AXI_ARESETN)
	                  begin
	                    state_read <= Raddr;
	                    axi_arready <= 1'b1;
	                  end
                    // Reset still low, waiting in Idle
	                else state_read <= state_read;
	              end
	            Raddr:
	              begin
                    // Address is valid and master can read the bus
	                if (S_AXI_ARVALID && S_AXI_ARREADY)
	                  begin
	                    state_read <= Rdata;            // Move on to read data (Rdata)
	                    axi_araddr <= S_AXI_ARADDR;     // Take the address
	                    axi_rvalid <= 1'b1;             // Inform master that data on bus is valid (rvalid)
	                    axi_arready <= 1'b0;            // Take down flag ready for address (arready)
	                  end
                    // Address not valid yet, waiting in Raddr
	                else state_read <= state_read;
	              end
	            Rdata:
	              begin
                    // Master read the valid data we outputed
	                if (S_AXI_RVALID && S_AXI_RREADY)
	                  begin
	                    axi_rvalid <= 1'b0;             // Take down flag rvalid
	                    axi_arready <= 1'b1;            // Inform that we're ready for new address
	                    state_read <= Raddr;            // Go back to Raddr
	                  end
                    // Master is busy, wait with the data
	                else state_read <= state_read;
	              end
	           endcase
	          end
	        end

	// Address decoding
	assign S_AXI_RDATA = (axi_araddr[ADDR_LSB+2:ADDR_LSB] == 3'h0) ? slv_reg0 :
                         (axi_araddr[ADDR_LSB+2:ADDR_LSB] == 3'h1) ? slv_reg1 :
                         (axi_araddr[ADDR_LSB+2:ADDR_LSB] == 3'h2) ? slv_reg2 :
                         (axi_araddr[ADDR_LSB+2:ADDR_LSB] == 3'h3) ? slv_reg3 :
                         (axi_araddr[ADDR_LSB+2:ADDR_LSB] == 3'h4) ? slv_reg4 : 32'd0;

    // Module connection
    assign slv_reg0_we_out = slv_reg0_we_reg;
    assign slv_reg1_we_out = slv_reg1_we_reg;
    assign slv_reg2_we_out = slv_reg2_we_reg;
    assign slv_reg3_we_out = slv_reg3_we_reg;
    assign slv_reg4_we_out = slv_reg4_we_reg;

    assign slv_reg0_out = slv_reg0;
    assign slv_reg1_out = slv_reg1;
    assign slv_reg2_out = slv_reg2;
    assign slv_reg3_out = slv_reg3;
    assign slv_reg4_out = slv_reg4;

    always @(posedge S_AXI_ACLK)
        begin
            if (slv_reg0_valid) slv_reg0 <= slv_reg0_in;
            if (slv_reg1_valid) slv_reg1 <= slv_reg1_in;
            if (slv_reg2_valid) slv_reg2 <= slv_reg2_in;
            if (slv_reg3_valid) slv_reg3 <= slv_reg3_in;
            if (slv_reg4_valid) slv_reg4 <= slv_reg4_in;
        end


endmodule
