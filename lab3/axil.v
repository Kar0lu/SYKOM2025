module axil #(
    parameter ADDR_WIDTH = 4    // 4 registers: 0x00, 0x04, 0x08, 0x12
)(
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

    // Inner wires and registers
    wire axil_read_ready, axil_write_ready;
    reg axil_read_valid, axil_awready, axil_bvalid, axil_arready;
    reg [31:0] axil_read_data;

    // Our registers
    reg [31:0] ctrl_reg, in_angle_reg, out_cos_reg, out_sin_reg;

    // Strobe wires
    wire [31:0] ctrl_strb, in_angle_strb;
  
    // Write logic
	always @(posedge S_AXI_ACLK)
	if (!S_AXI_ARESETN)
	begin
        // Ctrl
		ctrl_reg <= 0;

        // Input
		in_angle_reg <= 0;
    end else if (axil_write_ready) 
    begin
		case(S_AXI_AWADDR[ADDR_WIDTH-1:2])
		2'b00: ctrl_reg <= ctrl_strb;
		2'b01: in_angle_reg <= in_angle_strb;
		// out_sin_reg and out_cos_reg are ro (outputs)
		endcase
    end

    // Write strobe logic
    function [31:0]	apply_wstrb;
		input [31:0] prior_data;
		input [31:0] new_data;
		input [3:0] wstrb;

		integer	k;
		for(k = 0; k < 4; k = k+1)
		begin
			apply_wstrb[k*8 +: 8] = wstrb[k] ? new_data[k*8 +: 8] : prior_data[k*8 +: 8];
		end
	endfunction

    assign ctrl_strb = apply_wstrb(ctrl_reg, S_AXI_WDATA, S_AXI_WSTRB);
    assign in_angle_strb = apply_wstrb(in_angle_reg, S_AXI_WDATA, S_AXI_WSTRB);


    // Read logic
    always @(posedge S_AXI_ACLK)
    begin
    if (!S_AXI_ARESETN)
    begin
        axil_read_data <= 0;
    end else if (!S_AXI_RVALID || S_AXI_RREADY) 
    begin
		case(S_AXI_ARADDR[ADDR_WIDTH-1:2])
            2'b00:  axil_read_data <= ctrl_reg;
            2'b01:	axil_read_data <= in_angle_reg;
            2'b10:	axil_read_data <= out_cos_reg;
            2'b11:	axil_read_data <= out_sin_reg;
		endcase
	end
    if (!axil_read_ready)
        axil_read_data <= 0;
    end
    assign S_AXI_RDATA = axil_read_data;

    // Every operation is successfull
    assign S_AXI_BRESP = 2'b00;
	assign S_AXI_RRESP = 2'b00;

    // Read response
	always @(posedge S_AXI_ACLK)
	if (!S_AXI_ARESETN)
		axil_read_valid <= 1'b0;
	else if (axil_read_ready)
		axil_read_valid <= 1'b1;
	else if (S_AXI_RREADY)
		axil_read_valid <= 1'b0;

	assign S_AXI_RVALID = axil_read_valid;

    // We are ready for read once address is valid and we are ready for address
    assign axil_read_ready = (S_AXI_ARVALID && S_AXI_ARREADY);

    // We are ready for next read when rvalid is down
    always @(*)
	    axil_arready = !S_AXI_RVALID;

	assign S_AXI_ARREADY = axil_arready;


    // Write response
	always @(posedge S_AXI_ACLK)
	if (!S_AXI_ARESETN)
		axil_bvalid <= 0;
	else if (axil_write_ready)
		axil_bvalid <= 1;
    else if (S_AXI_BREADY)
		axil_bvalid <= 0;

    assign S_AXI_BVALID = axil_bvalid;

    // Write ready signals
    always @(posedge S_AXI_ACLK)
    if (!S_AXI_ARESETN)
		axil_awready <= 1'b0;
	else
		axil_awready <= !axil_awready &&                        // Throttling so as to make sure that we are not waiting for master to read bresp
                        (S_AXI_AWVALID && S_AXI_WVALID) &&      // Address and data on bus are valid and
                        (!S_AXI_BVALID || S_AXI_BREADY);        // we do not have any write that waits for master read

    // AWREADY and WREADY are basically the same
    assign	S_AXI_AWREADY = axil_awready;
	assign	S_AXI_WREADY  = axil_awready;

    assign axil_write_ready = axil_awready;


    // Rewritting DWORDs from ctrl_reg to out_cos_reg and from in_angle_reg to out_sin_reg
    always @(posedge S_AXI_ACLK)
    begin
        out_cos_reg <= ctrl_reg;
        out_sin_reg <= in_angle_reg;
    end 


endmodule