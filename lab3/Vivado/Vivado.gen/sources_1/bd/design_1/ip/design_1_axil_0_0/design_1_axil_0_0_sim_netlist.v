// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Thu May  8 20:52:52 2025
// Host        : debian running 64-bit Debian GNU/Linux 12 (bookworm)
// Command     : write_verilog -force -mode funcsim
//               /home/kacper/Dokumenty/SYKOM2025/lab3/AXI-Lite/Vivado.gen/sources_1/bd/design_1/ip/design_1_axil_0_0/design_1_axil_0_0_sim_netlist.v
// Design      : design_1_axil_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_axil_0_0,axil,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "axil,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module design_1_axil_0_0
   (S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_AWADDR,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BREADY,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_ARADDR,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_RREADY);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_AXI_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_ACLK, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET S_AXI_ARESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input S_AXI_ACLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S_AXI_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input S_AXI_ARESETN;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) input [3:0]S_AXI_AWADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input S_AXI_AWVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output S_AXI_AWREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [31:0]S_AXI_WDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [3:0]S_AXI_WSTRB;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input S_AXI_WVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output S_AXI_WREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input S_AXI_BREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]S_AXI_BRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output S_AXI_BVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [3:0]S_AXI_ARADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input S_AXI_ARVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output S_AXI_ARREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [31:0]S_AXI_RDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]S_AXI_RRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output S_AXI_RVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input S_AXI_RREADY;

  wire \<const0> ;
  wire S_AXI_ACLK;
  wire [3:0]S_AXI_ARADDR;
  wire S_AXI_ARESETN;
  wire S_AXI_ARREADY;
  wire S_AXI_ARVALID;
  wire [3:0]S_AXI_AWADDR;
  wire S_AXI_AWVALID;
  wire S_AXI_BREADY;
  wire S_AXI_BVALID;
  wire [31:0]S_AXI_RDATA;
  wire S_AXI_RREADY;
  wire S_AXI_RVALID;
  wire [31:0]S_AXI_WDATA;
  wire S_AXI_WREADY;
  wire [3:0]S_AXI_WSTRB;
  wire S_AXI_WVALID;

  assign S_AXI_AWREADY = S_AXI_WREADY;
  assign S_AXI_BRESP[1] = \<const0> ;
  assign S_AXI_BRESP[0] = \<const0> ;
  assign S_AXI_RRESP[1] = \<const0> ;
  assign S_AXI_RRESP[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_1_axil_0_0_axil inst
       (.S_AXI_ACLK(S_AXI_ACLK),
        .S_AXI_ARADDR(S_AXI_ARADDR[3:2]),
        .S_AXI_ARESETN(S_AXI_ARESETN),
        .S_AXI_ARREADY(S_AXI_ARREADY),
        .S_AXI_ARVALID(S_AXI_ARVALID),
        .S_AXI_AWADDR(S_AXI_AWADDR[3:2]),
        .S_AXI_AWVALID(S_AXI_AWVALID),
        .S_AXI_BREADY(S_AXI_BREADY),
        .S_AXI_BVALID(S_AXI_BVALID),
        .S_AXI_RDATA(S_AXI_RDATA),
        .S_AXI_RREADY(S_AXI_RREADY),
        .S_AXI_WDATA(S_AXI_WDATA),
        .S_AXI_WSTRB(S_AXI_WSTRB),
        .S_AXI_WVALID(S_AXI_WVALID),
        .axil_awready_reg_0(S_AXI_WREADY),
        .axil_read_valid_reg_0(S_AXI_RVALID));
endmodule

(* ORIG_REF_NAME = "axil" *) 
module design_1_axil_0_0_axil
   (axil_read_valid_reg_0,
    S_AXI_RDATA,
    axil_awready_reg_0,
    S_AXI_ARREADY,
    S_AXI_BVALID,
    S_AXI_ARVALID,
    S_AXI_ARESETN,
    S_AXI_WDATA,
    S_AXI_ACLK,
    S_AXI_ARADDR,
    S_AXI_AWADDR,
    S_AXI_WSTRB,
    S_AXI_BREADY,
    S_AXI_RREADY,
    S_AXI_AWVALID,
    S_AXI_WVALID);
  output axil_read_valid_reg_0;
  output [31:0]S_AXI_RDATA;
  output axil_awready_reg_0;
  output S_AXI_ARREADY;
  output S_AXI_BVALID;
  input S_AXI_ARVALID;
  input S_AXI_ARESETN;
  input [31:0]S_AXI_WDATA;
  input S_AXI_ACLK;
  input [1:0]S_AXI_ARADDR;
  input [1:0]S_AXI_AWADDR;
  input [3:0]S_AXI_WSTRB;
  input S_AXI_BREADY;
  input S_AXI_RREADY;
  input S_AXI_AWVALID;
  input S_AXI_WVALID;

  wire S_AXI_ACLK;
  wire [1:0]S_AXI_ARADDR;
  wire S_AXI_ARESETN;
  wire S_AXI_ARREADY;
  wire S_AXI_ARVALID;
  wire [1:0]S_AXI_AWADDR;
  wire S_AXI_AWVALID;
  wire S_AXI_BREADY;
  wire S_AXI_BVALID;
  wire [31:0]S_AXI_RDATA;
  wire S_AXI_RREADY;
  wire [31:0]S_AXI_WDATA;
  wire [3:0]S_AXI_WSTRB;
  wire S_AXI_WVALID;
  wire axil_awready_i_1_n_0;
  wire axil_awready_reg_0;
  wire axil_bvalid_i_1_n_0;
  wire \axil_read_data[0]_i_1_n_0 ;
  wire \axil_read_data[10]_i_1_n_0 ;
  wire \axil_read_data[11]_i_1_n_0 ;
  wire \axil_read_data[12]_i_1_n_0 ;
  wire \axil_read_data[13]_i_1_n_0 ;
  wire \axil_read_data[14]_i_1_n_0 ;
  wire \axil_read_data[15]_i_1_n_0 ;
  wire \axil_read_data[16]_i_1_n_0 ;
  wire \axil_read_data[17]_i_1_n_0 ;
  wire \axil_read_data[18]_i_1_n_0 ;
  wire \axil_read_data[19]_i_1_n_0 ;
  wire \axil_read_data[1]_i_1_n_0 ;
  wire \axil_read_data[20]_i_1_n_0 ;
  wire \axil_read_data[21]_i_1_n_0 ;
  wire \axil_read_data[22]_i_1_n_0 ;
  wire \axil_read_data[23]_i_1_n_0 ;
  wire \axil_read_data[24]_i_1_n_0 ;
  wire \axil_read_data[25]_i_1_n_0 ;
  wire \axil_read_data[26]_i_1_n_0 ;
  wire \axil_read_data[27]_i_1_n_0 ;
  wire \axil_read_data[28]_i_1_n_0 ;
  wire \axil_read_data[29]_i_1_n_0 ;
  wire \axil_read_data[2]_i_1_n_0 ;
  wire \axil_read_data[30]_i_1_n_0 ;
  wire \axil_read_data[31]_i_1_n_0 ;
  wire \axil_read_data[31]_i_2_n_0 ;
  wire \axil_read_data[3]_i_1_n_0 ;
  wire \axil_read_data[4]_i_1_n_0 ;
  wire \axil_read_data[5]_i_1_n_0 ;
  wire \axil_read_data[6]_i_1_n_0 ;
  wire \axil_read_data[7]_i_1_n_0 ;
  wire \axil_read_data[8]_i_1_n_0 ;
  wire \axil_read_data[9]_i_1_n_0 ;
  wire axil_read_valid_i_1_n_0;
  wire axil_read_valid_reg_0;
  wire [31:0]ctrl_reg;
  wire \ctrl_reg[15]_i_1_n_0 ;
  wire \ctrl_reg[23]_i_1_n_0 ;
  wire \ctrl_reg[31]_i_1_n_0 ;
  wire \ctrl_reg[7]_i_1_n_0 ;
  wire [31:0]in_angle_reg;
  wire \in_angle_reg[31]_i_1_n_0 ;
  wire [31:0]out_cos_reg;
  wire [31:0]out_sin_reg;
  wire [31:7]p_1_in;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT1 #(
    .INIT(2'h1)) 
    S_AXI_ARREADY_INST_0
       (.I0(axil_read_valid_reg_0),
        .O(S_AXI_ARREADY));
  LUT6 #(
    .INIT(64'h0808000800000000)) 
    axil_awready_i_1
       (.I0(S_AXI_AWVALID),
        .I1(S_AXI_WVALID),
        .I2(axil_awready_reg_0),
        .I3(S_AXI_BVALID),
        .I4(S_AXI_BREADY),
        .I5(S_AXI_ARESETN),
        .O(axil_awready_i_1_n_0));
  FDRE axil_awready_reg
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(axil_awready_i_1_n_0),
        .Q(axil_awready_reg_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hF200)) 
    axil_bvalid_i_1
       (.I0(S_AXI_BVALID),
        .I1(S_AXI_BREADY),
        .I2(axil_awready_reg_0),
        .I3(S_AXI_ARESETN),
        .O(axil_bvalid_i_1_n_0));
  FDRE axil_bvalid_reg
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(axil_bvalid_i_1_n_0),
        .Q(S_AXI_BVALID),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[0]_i_1 
       (.I0(in_angle_reg[0]),
        .I1(ctrl_reg[0]),
        .I2(out_sin_reg[0]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[0]),
        .O(\axil_read_data[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[10]_i_1 
       (.I0(in_angle_reg[10]),
        .I1(ctrl_reg[10]),
        .I2(out_sin_reg[10]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[10]),
        .O(\axil_read_data[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[11]_i_1 
       (.I0(in_angle_reg[11]),
        .I1(ctrl_reg[11]),
        .I2(out_sin_reg[11]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[11]),
        .O(\axil_read_data[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[12]_i_1 
       (.I0(in_angle_reg[12]),
        .I1(ctrl_reg[12]),
        .I2(out_sin_reg[12]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[12]),
        .O(\axil_read_data[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[13]_i_1 
       (.I0(in_angle_reg[13]),
        .I1(ctrl_reg[13]),
        .I2(out_sin_reg[13]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[13]),
        .O(\axil_read_data[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[14]_i_1 
       (.I0(in_angle_reg[14]),
        .I1(ctrl_reg[14]),
        .I2(out_sin_reg[14]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[14]),
        .O(\axil_read_data[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[15]_i_1 
       (.I0(in_angle_reg[15]),
        .I1(ctrl_reg[15]),
        .I2(out_sin_reg[15]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[15]),
        .O(\axil_read_data[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[16]_i_1 
       (.I0(in_angle_reg[16]),
        .I1(ctrl_reg[16]),
        .I2(out_sin_reg[16]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[16]),
        .O(\axil_read_data[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[17]_i_1 
       (.I0(in_angle_reg[17]),
        .I1(ctrl_reg[17]),
        .I2(out_sin_reg[17]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[17]),
        .O(\axil_read_data[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[18]_i_1 
       (.I0(in_angle_reg[18]),
        .I1(ctrl_reg[18]),
        .I2(out_sin_reg[18]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[18]),
        .O(\axil_read_data[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[19]_i_1 
       (.I0(in_angle_reg[19]),
        .I1(ctrl_reg[19]),
        .I2(out_sin_reg[19]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[19]),
        .O(\axil_read_data[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[1]_i_1 
       (.I0(in_angle_reg[1]),
        .I1(ctrl_reg[1]),
        .I2(out_sin_reg[1]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[1]),
        .O(\axil_read_data[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[20]_i_1 
       (.I0(in_angle_reg[20]),
        .I1(ctrl_reg[20]),
        .I2(out_sin_reg[20]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[20]),
        .O(\axil_read_data[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[21]_i_1 
       (.I0(in_angle_reg[21]),
        .I1(ctrl_reg[21]),
        .I2(out_sin_reg[21]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[21]),
        .O(\axil_read_data[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[22]_i_1 
       (.I0(in_angle_reg[22]),
        .I1(ctrl_reg[22]),
        .I2(out_sin_reg[22]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[22]),
        .O(\axil_read_data[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[23]_i_1 
       (.I0(in_angle_reg[23]),
        .I1(ctrl_reg[23]),
        .I2(out_sin_reg[23]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[23]),
        .O(\axil_read_data[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[24]_i_1 
       (.I0(in_angle_reg[24]),
        .I1(ctrl_reg[24]),
        .I2(out_sin_reg[24]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[24]),
        .O(\axil_read_data[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[25]_i_1 
       (.I0(in_angle_reg[25]),
        .I1(ctrl_reg[25]),
        .I2(out_sin_reg[25]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[25]),
        .O(\axil_read_data[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[26]_i_1 
       (.I0(in_angle_reg[26]),
        .I1(ctrl_reg[26]),
        .I2(out_sin_reg[26]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[26]),
        .O(\axil_read_data[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[27]_i_1 
       (.I0(in_angle_reg[27]),
        .I1(ctrl_reg[27]),
        .I2(out_sin_reg[27]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[27]),
        .O(\axil_read_data[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[28]_i_1 
       (.I0(in_angle_reg[28]),
        .I1(ctrl_reg[28]),
        .I2(out_sin_reg[28]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[28]),
        .O(\axil_read_data[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[29]_i_1 
       (.I0(in_angle_reg[29]),
        .I1(ctrl_reg[29]),
        .I2(out_sin_reg[29]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[29]),
        .O(\axil_read_data[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[2]_i_1 
       (.I0(in_angle_reg[2]),
        .I1(ctrl_reg[2]),
        .I2(out_sin_reg[2]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[2]),
        .O(\axil_read_data[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[30]_i_1 
       (.I0(in_angle_reg[30]),
        .I1(ctrl_reg[30]),
        .I2(out_sin_reg[30]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[30]),
        .O(\axil_read_data[30]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hBF)) 
    \axil_read_data[31]_i_1 
       (.I0(axil_read_valid_reg_0),
        .I1(S_AXI_ARVALID),
        .I2(S_AXI_ARESETN),
        .O(\axil_read_data[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[31]_i_2 
       (.I0(in_angle_reg[31]),
        .I1(ctrl_reg[31]),
        .I2(out_sin_reg[31]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[31]),
        .O(\axil_read_data[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[3]_i_1 
       (.I0(in_angle_reg[3]),
        .I1(ctrl_reg[3]),
        .I2(out_sin_reg[3]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[3]),
        .O(\axil_read_data[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[4]_i_1 
       (.I0(in_angle_reg[4]),
        .I1(ctrl_reg[4]),
        .I2(out_sin_reg[4]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[4]),
        .O(\axil_read_data[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[5]_i_1 
       (.I0(in_angle_reg[5]),
        .I1(ctrl_reg[5]),
        .I2(out_sin_reg[5]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[5]),
        .O(\axil_read_data[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[6]_i_1 
       (.I0(in_angle_reg[6]),
        .I1(ctrl_reg[6]),
        .I2(out_sin_reg[6]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[6]),
        .O(\axil_read_data[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[7]_i_1 
       (.I0(in_angle_reg[7]),
        .I1(ctrl_reg[7]),
        .I2(out_sin_reg[7]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[7]),
        .O(\axil_read_data[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[8]_i_1 
       (.I0(in_angle_reg[8]),
        .I1(ctrl_reg[8]),
        .I2(out_sin_reg[8]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[8]),
        .O(\axil_read_data[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axil_read_data[9]_i_1 
       (.I0(in_angle_reg[9]),
        .I1(ctrl_reg[9]),
        .I2(out_sin_reg[9]),
        .I3(S_AXI_ARADDR[1]),
        .I4(S_AXI_ARADDR[0]),
        .I5(out_cos_reg[9]),
        .O(\axil_read_data[9]_i_1_n_0 ));
  FDRE \axil_read_data_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[0]_i_1_n_0 ),
        .Q(S_AXI_RDATA[0]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[10] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[10]_i_1_n_0 ),
        .Q(S_AXI_RDATA[10]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[11] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[11]_i_1_n_0 ),
        .Q(S_AXI_RDATA[11]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[12] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[12]_i_1_n_0 ),
        .Q(S_AXI_RDATA[12]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[13] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[13]_i_1_n_0 ),
        .Q(S_AXI_RDATA[13]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[14] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[14]_i_1_n_0 ),
        .Q(S_AXI_RDATA[14]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[15] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[15]_i_1_n_0 ),
        .Q(S_AXI_RDATA[15]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[16] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[16]_i_1_n_0 ),
        .Q(S_AXI_RDATA[16]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[17] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[17]_i_1_n_0 ),
        .Q(S_AXI_RDATA[17]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[18] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[18]_i_1_n_0 ),
        .Q(S_AXI_RDATA[18]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[19] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[19]_i_1_n_0 ),
        .Q(S_AXI_RDATA[19]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[1]_i_1_n_0 ),
        .Q(S_AXI_RDATA[1]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[20] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[20]_i_1_n_0 ),
        .Q(S_AXI_RDATA[20]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[21] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[21]_i_1_n_0 ),
        .Q(S_AXI_RDATA[21]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[22] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[22]_i_1_n_0 ),
        .Q(S_AXI_RDATA[22]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[23] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[23]_i_1_n_0 ),
        .Q(S_AXI_RDATA[23]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[24] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[24]_i_1_n_0 ),
        .Q(S_AXI_RDATA[24]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[25] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[25]_i_1_n_0 ),
        .Q(S_AXI_RDATA[25]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[26] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[26]_i_1_n_0 ),
        .Q(S_AXI_RDATA[26]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[27] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[27]_i_1_n_0 ),
        .Q(S_AXI_RDATA[27]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[28] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[28]_i_1_n_0 ),
        .Q(S_AXI_RDATA[28]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[29] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[29]_i_1_n_0 ),
        .Q(S_AXI_RDATA[29]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[2]_i_1_n_0 ),
        .Q(S_AXI_RDATA[2]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[30] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[30]_i_1_n_0 ),
        .Q(S_AXI_RDATA[30]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[31] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[31]_i_2_n_0 ),
        .Q(S_AXI_RDATA[31]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[3]_i_1_n_0 ),
        .Q(S_AXI_RDATA[3]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[4]_i_1_n_0 ),
        .Q(S_AXI_RDATA[4]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[5]_i_1_n_0 ),
        .Q(S_AXI_RDATA[5]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[6]_i_1_n_0 ),
        .Q(S_AXI_RDATA[6]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[7]_i_1_n_0 ),
        .Q(S_AXI_RDATA[7]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[8] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[8]_i_1_n_0 ),
        .Q(S_AXI_RDATA[8]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  FDRE \axil_read_data_reg[9] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\axil_read_data[9]_i_1_n_0 ),
        .Q(S_AXI_RDATA[9]),
        .R(\axil_read_data[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h5C00)) 
    axil_read_valid_i_1
       (.I0(S_AXI_RREADY),
        .I1(S_AXI_ARVALID),
        .I2(axil_read_valid_reg_0),
        .I3(S_AXI_ARESETN),
        .O(axil_read_valid_i_1_n_0));
  FDRE axil_read_valid_reg
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(axil_read_valid_i_1_n_0),
        .Q(axil_read_valid_reg_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0020)) 
    \ctrl_reg[15]_i_1 
       (.I0(axil_awready_reg_0),
        .I1(S_AXI_AWADDR[1]),
        .I2(S_AXI_WSTRB[1]),
        .I3(S_AXI_AWADDR[0]),
        .O(\ctrl_reg[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0020)) 
    \ctrl_reg[23]_i_1 
       (.I0(axil_awready_reg_0),
        .I1(S_AXI_AWADDR[1]),
        .I2(S_AXI_WSTRB[2]),
        .I3(S_AXI_AWADDR[0]),
        .O(\ctrl_reg[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0020)) 
    \ctrl_reg[31]_i_1 
       (.I0(axil_awready_reg_0),
        .I1(S_AXI_AWADDR[1]),
        .I2(S_AXI_WSTRB[3]),
        .I3(S_AXI_AWADDR[0]),
        .O(\ctrl_reg[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0020)) 
    \ctrl_reg[7]_i_1 
       (.I0(axil_awready_reg_0),
        .I1(S_AXI_AWADDR[1]),
        .I2(S_AXI_WSTRB[0]),
        .I3(S_AXI_AWADDR[0]),
        .O(\ctrl_reg[7]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[7]_i_1_n_0 ),
        .D(S_AXI_WDATA[0]),
        .Q(ctrl_reg[0]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[10] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[15]_i_1_n_0 ),
        .D(S_AXI_WDATA[10]),
        .Q(ctrl_reg[10]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[11] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[15]_i_1_n_0 ),
        .D(S_AXI_WDATA[11]),
        .Q(ctrl_reg[11]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[12] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[15]_i_1_n_0 ),
        .D(S_AXI_WDATA[12]),
        .Q(ctrl_reg[12]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[13] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[15]_i_1_n_0 ),
        .D(S_AXI_WDATA[13]),
        .Q(ctrl_reg[13]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[14] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[15]_i_1_n_0 ),
        .D(S_AXI_WDATA[14]),
        .Q(ctrl_reg[14]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[15] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[15]_i_1_n_0 ),
        .D(S_AXI_WDATA[15]),
        .Q(ctrl_reg[15]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[16] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[23]_i_1_n_0 ),
        .D(S_AXI_WDATA[16]),
        .Q(ctrl_reg[16]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[17] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[23]_i_1_n_0 ),
        .D(S_AXI_WDATA[17]),
        .Q(ctrl_reg[17]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[18] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[23]_i_1_n_0 ),
        .D(S_AXI_WDATA[18]),
        .Q(ctrl_reg[18]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[19] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[23]_i_1_n_0 ),
        .D(S_AXI_WDATA[19]),
        .Q(ctrl_reg[19]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[7]_i_1_n_0 ),
        .D(S_AXI_WDATA[1]),
        .Q(ctrl_reg[1]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[20] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[23]_i_1_n_0 ),
        .D(S_AXI_WDATA[20]),
        .Q(ctrl_reg[20]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[21] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[23]_i_1_n_0 ),
        .D(S_AXI_WDATA[21]),
        .Q(ctrl_reg[21]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[22] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[23]_i_1_n_0 ),
        .D(S_AXI_WDATA[22]),
        .Q(ctrl_reg[22]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[23] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[23]_i_1_n_0 ),
        .D(S_AXI_WDATA[23]),
        .Q(ctrl_reg[23]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[24] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[31]_i_1_n_0 ),
        .D(S_AXI_WDATA[24]),
        .Q(ctrl_reg[24]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[25] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[31]_i_1_n_0 ),
        .D(S_AXI_WDATA[25]),
        .Q(ctrl_reg[25]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[26] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[31]_i_1_n_0 ),
        .D(S_AXI_WDATA[26]),
        .Q(ctrl_reg[26]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[27] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[31]_i_1_n_0 ),
        .D(S_AXI_WDATA[27]),
        .Q(ctrl_reg[27]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[28] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[31]_i_1_n_0 ),
        .D(S_AXI_WDATA[28]),
        .Q(ctrl_reg[28]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[29] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[31]_i_1_n_0 ),
        .D(S_AXI_WDATA[29]),
        .Q(ctrl_reg[29]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[7]_i_1_n_0 ),
        .D(S_AXI_WDATA[2]),
        .Q(ctrl_reg[2]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[30] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[31]_i_1_n_0 ),
        .D(S_AXI_WDATA[30]),
        .Q(ctrl_reg[30]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[31] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[31]_i_1_n_0 ),
        .D(S_AXI_WDATA[31]),
        .Q(ctrl_reg[31]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[7]_i_1_n_0 ),
        .D(S_AXI_WDATA[3]),
        .Q(ctrl_reg[3]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[7]_i_1_n_0 ),
        .D(S_AXI_WDATA[4]),
        .Q(ctrl_reg[4]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[7]_i_1_n_0 ),
        .D(S_AXI_WDATA[5]),
        .Q(ctrl_reg[5]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[7]_i_1_n_0 ),
        .D(S_AXI_WDATA[6]),
        .Q(ctrl_reg[6]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[7]_i_1_n_0 ),
        .D(S_AXI_WDATA[7]),
        .Q(ctrl_reg[7]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[8] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[15]_i_1_n_0 ),
        .D(S_AXI_WDATA[8]),
        .Q(ctrl_reg[8]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \ctrl_reg_reg[9] 
       (.C(S_AXI_ACLK),
        .CE(\ctrl_reg[15]_i_1_n_0 ),
        .D(S_AXI_WDATA[9]),
        .Q(ctrl_reg[9]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \in_angle_reg[15]_i_1 
       (.I0(axil_awready_reg_0),
        .I1(S_AXI_AWADDR[1]),
        .I2(S_AXI_AWADDR[0]),
        .I3(S_AXI_WSTRB[1]),
        .O(p_1_in[15]));
  LUT4 #(
    .INIT(16'h2000)) 
    \in_angle_reg[23]_i_1 
       (.I0(axil_awready_reg_0),
        .I1(S_AXI_AWADDR[1]),
        .I2(S_AXI_AWADDR[0]),
        .I3(S_AXI_WSTRB[2]),
        .O(p_1_in[23]));
  LUT1 #(
    .INIT(2'h1)) 
    \in_angle_reg[31]_i_1 
       (.I0(S_AXI_ARESETN),
        .O(\in_angle_reg[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \in_angle_reg[31]_i_2 
       (.I0(axil_awready_reg_0),
        .I1(S_AXI_AWADDR[1]),
        .I2(S_AXI_AWADDR[0]),
        .I3(S_AXI_WSTRB[3]),
        .O(p_1_in[31]));
  LUT4 #(
    .INIT(16'h2000)) 
    \in_angle_reg[7]_i_1 
       (.I0(axil_awready_reg_0),
        .I1(S_AXI_AWADDR[1]),
        .I2(S_AXI_AWADDR[0]),
        .I3(S_AXI_WSTRB[0]),
        .O(p_1_in[7]));
  FDRE \in_angle_reg_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[7]),
        .D(S_AXI_WDATA[0]),
        .Q(in_angle_reg[0]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[10] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[15]),
        .D(S_AXI_WDATA[10]),
        .Q(in_angle_reg[10]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[11] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[15]),
        .D(S_AXI_WDATA[11]),
        .Q(in_angle_reg[11]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[12] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[15]),
        .D(S_AXI_WDATA[12]),
        .Q(in_angle_reg[12]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[13] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[15]),
        .D(S_AXI_WDATA[13]),
        .Q(in_angle_reg[13]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[14] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[15]),
        .D(S_AXI_WDATA[14]),
        .Q(in_angle_reg[14]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[15] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[15]),
        .D(S_AXI_WDATA[15]),
        .Q(in_angle_reg[15]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[16] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[23]),
        .D(S_AXI_WDATA[16]),
        .Q(in_angle_reg[16]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[17] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[23]),
        .D(S_AXI_WDATA[17]),
        .Q(in_angle_reg[17]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[18] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[23]),
        .D(S_AXI_WDATA[18]),
        .Q(in_angle_reg[18]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[19] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[23]),
        .D(S_AXI_WDATA[19]),
        .Q(in_angle_reg[19]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[7]),
        .D(S_AXI_WDATA[1]),
        .Q(in_angle_reg[1]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[20] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[23]),
        .D(S_AXI_WDATA[20]),
        .Q(in_angle_reg[20]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[21] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[23]),
        .D(S_AXI_WDATA[21]),
        .Q(in_angle_reg[21]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[22] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[23]),
        .D(S_AXI_WDATA[22]),
        .Q(in_angle_reg[22]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[23] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[23]),
        .D(S_AXI_WDATA[23]),
        .Q(in_angle_reg[23]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[24] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[31]),
        .D(S_AXI_WDATA[24]),
        .Q(in_angle_reg[24]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[25] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[31]),
        .D(S_AXI_WDATA[25]),
        .Q(in_angle_reg[25]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[26] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[31]),
        .D(S_AXI_WDATA[26]),
        .Q(in_angle_reg[26]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[27] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[31]),
        .D(S_AXI_WDATA[27]),
        .Q(in_angle_reg[27]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[28] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[31]),
        .D(S_AXI_WDATA[28]),
        .Q(in_angle_reg[28]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[29] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[31]),
        .D(S_AXI_WDATA[29]),
        .Q(in_angle_reg[29]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[7]),
        .D(S_AXI_WDATA[2]),
        .Q(in_angle_reg[2]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[30] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[31]),
        .D(S_AXI_WDATA[30]),
        .Q(in_angle_reg[30]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[31] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[31]),
        .D(S_AXI_WDATA[31]),
        .Q(in_angle_reg[31]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[7]),
        .D(S_AXI_WDATA[3]),
        .Q(in_angle_reg[3]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[7]),
        .D(S_AXI_WDATA[4]),
        .Q(in_angle_reg[4]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[7]),
        .D(S_AXI_WDATA[5]),
        .Q(in_angle_reg[5]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[7]),
        .D(S_AXI_WDATA[6]),
        .Q(in_angle_reg[6]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[7]),
        .D(S_AXI_WDATA[7]),
        .Q(in_angle_reg[7]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[8] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[15]),
        .D(S_AXI_WDATA[8]),
        .Q(in_angle_reg[8]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \in_angle_reg_reg[9] 
       (.C(S_AXI_ACLK),
        .CE(p_1_in[15]),
        .D(S_AXI_WDATA[9]),
        .Q(in_angle_reg[9]),
        .R(\in_angle_reg[31]_i_1_n_0 ));
  FDRE \out_cos_reg_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[0]),
        .Q(out_cos_reg[0]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[10] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[10]),
        .Q(out_cos_reg[10]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[11] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[11]),
        .Q(out_cos_reg[11]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[12] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[12]),
        .Q(out_cos_reg[12]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[13] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[13]),
        .Q(out_cos_reg[13]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[14] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[14]),
        .Q(out_cos_reg[14]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[15] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[15]),
        .Q(out_cos_reg[15]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[16] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[16]),
        .Q(out_cos_reg[16]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[17] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[17]),
        .Q(out_cos_reg[17]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[18] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[18]),
        .Q(out_cos_reg[18]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[19] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[19]),
        .Q(out_cos_reg[19]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[1]),
        .Q(out_cos_reg[1]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[20] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[20]),
        .Q(out_cos_reg[20]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[21] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[21]),
        .Q(out_cos_reg[21]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[22] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[22]),
        .Q(out_cos_reg[22]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[23] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[23]),
        .Q(out_cos_reg[23]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[24] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[24]),
        .Q(out_cos_reg[24]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[25] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[25]),
        .Q(out_cos_reg[25]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[26] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[26]),
        .Q(out_cos_reg[26]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[27] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[27]),
        .Q(out_cos_reg[27]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[28] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[28]),
        .Q(out_cos_reg[28]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[29] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[29]),
        .Q(out_cos_reg[29]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[2]),
        .Q(out_cos_reg[2]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[30] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[30]),
        .Q(out_cos_reg[30]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[31] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[31]),
        .Q(out_cos_reg[31]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[3]),
        .Q(out_cos_reg[3]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[4]),
        .Q(out_cos_reg[4]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[5]),
        .Q(out_cos_reg[5]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[6]),
        .Q(out_cos_reg[6]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[7]),
        .Q(out_cos_reg[7]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[8] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[8]),
        .Q(out_cos_reg[8]),
        .R(1'b0));
  FDRE \out_cos_reg_reg[9] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(ctrl_reg[9]),
        .Q(out_cos_reg[9]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[0]),
        .Q(out_sin_reg[0]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[10] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[10]),
        .Q(out_sin_reg[10]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[11] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[11]),
        .Q(out_sin_reg[11]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[12] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[12]),
        .Q(out_sin_reg[12]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[13] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[13]),
        .Q(out_sin_reg[13]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[14] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[14]),
        .Q(out_sin_reg[14]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[15] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[15]),
        .Q(out_sin_reg[15]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[16] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[16]),
        .Q(out_sin_reg[16]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[17] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[17]),
        .Q(out_sin_reg[17]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[18] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[18]),
        .Q(out_sin_reg[18]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[19] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[19]),
        .Q(out_sin_reg[19]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[1]),
        .Q(out_sin_reg[1]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[20] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[20]),
        .Q(out_sin_reg[20]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[21] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[21]),
        .Q(out_sin_reg[21]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[22] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[22]),
        .Q(out_sin_reg[22]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[23] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[23]),
        .Q(out_sin_reg[23]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[24] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[24]),
        .Q(out_sin_reg[24]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[25] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[25]),
        .Q(out_sin_reg[25]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[26] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[26]),
        .Q(out_sin_reg[26]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[27] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[27]),
        .Q(out_sin_reg[27]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[28] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[28]),
        .Q(out_sin_reg[28]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[29] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[29]),
        .Q(out_sin_reg[29]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[2]),
        .Q(out_sin_reg[2]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[30] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[30]),
        .Q(out_sin_reg[30]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[31] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[31]),
        .Q(out_sin_reg[31]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[3]),
        .Q(out_sin_reg[3]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[4]),
        .Q(out_sin_reg[4]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[5]),
        .Q(out_sin_reg[5]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[6]),
        .Q(out_sin_reg[6]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[7]),
        .Q(out_sin_reg[7]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[8] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[8]),
        .Q(out_sin_reg[8]),
        .R(1'b0));
  FDRE \out_sin_reg_reg[9] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(in_angle_reg[9]),
        .Q(out_sin_reg[9]),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
