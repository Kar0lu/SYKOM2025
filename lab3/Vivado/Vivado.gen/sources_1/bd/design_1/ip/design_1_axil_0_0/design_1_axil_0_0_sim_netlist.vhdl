-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
-- Date        : Thu May  8 20:52:52 2025
-- Host        : debian running 64-bit Debian GNU/Linux 12 (bookworm)
-- Command     : write_vhdl -force -mode funcsim
--               /home/kacper/Dokumenty/SYKOM2025/lab3/AXI-Lite/Vivado.gen/sources_1/bd/design_1/ip/design_1_axil_0_0/design_1_axil_0_0_sim_netlist.vhdl
-- Design      : design_1_axil_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axil_0_0_axil is
  port (
    axil_read_valid_reg_0 : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axil_awready_reg_0 : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC;
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_WVALID : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_axil_0_0_axil : entity is "axil";
end design_1_axil_0_0_axil;

architecture STRUCTURE of design_1_axil_0_0_axil is
  signal \^s_axi_bvalid\ : STD_LOGIC;
  signal axil_awready_i_1_n_0 : STD_LOGIC;
  signal \^axil_awready_reg_0\ : STD_LOGIC;
  signal axil_bvalid_i_1_n_0 : STD_LOGIC;
  signal \axil_read_data[0]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[10]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[11]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[12]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[13]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[14]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[15]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[16]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[17]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[18]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[19]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[1]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[20]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[21]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[22]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[23]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[24]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[25]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[26]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[27]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[28]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[29]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[2]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[30]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[31]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[31]_i_2_n_0\ : STD_LOGIC;
  signal \axil_read_data[3]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[4]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[5]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[6]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[7]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[8]_i_1_n_0\ : STD_LOGIC;
  signal \axil_read_data[9]_i_1_n_0\ : STD_LOGIC;
  signal axil_read_valid_i_1_n_0 : STD_LOGIC;
  signal \^axil_read_valid_reg_0\ : STD_LOGIC;
  signal ctrl_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \ctrl_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \ctrl_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \ctrl_reg[31]_i_1_n_0\ : STD_LOGIC;
  signal \ctrl_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal in_angle_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \in_angle_reg[31]_i_1_n_0\ : STD_LOGIC;
  signal out_cos_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal out_sin_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 7 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of S_AXI_ARREADY_INST_0 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of axil_read_valid_i_1 : label is "soft_lutpair0";
begin
  S_AXI_BVALID <= \^s_axi_bvalid\;
  axil_awready_reg_0 <= \^axil_awready_reg_0\;
  axil_read_valid_reg_0 <= \^axil_read_valid_reg_0\;
S_AXI_ARREADY_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^axil_read_valid_reg_0\,
      O => S_AXI_ARREADY
    );
axil_awready_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0808000800000000"
    )
        port map (
      I0 => S_AXI_AWVALID,
      I1 => S_AXI_WVALID,
      I2 => \^axil_awready_reg_0\,
      I3 => \^s_axi_bvalid\,
      I4 => S_AXI_BREADY,
      I5 => S_AXI_ARESETN,
      O => axil_awready_i_1_n_0
    );
axil_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => axil_awready_i_1_n_0,
      Q => \^axil_awready_reg_0\,
      R => '0'
    );
axil_bvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F200"
    )
        port map (
      I0 => \^s_axi_bvalid\,
      I1 => S_AXI_BREADY,
      I2 => \^axil_awready_reg_0\,
      I3 => S_AXI_ARESETN,
      O => axil_bvalid_i_1_n_0
    );
axil_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => axil_bvalid_i_1_n_0,
      Q => \^s_axi_bvalid\,
      R => '0'
    );
\axil_read_data[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(0),
      I1 => ctrl_reg(0),
      I2 => out_sin_reg(0),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(0),
      O => \axil_read_data[0]_i_1_n_0\
    );
\axil_read_data[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(10),
      I1 => ctrl_reg(10),
      I2 => out_sin_reg(10),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(10),
      O => \axil_read_data[10]_i_1_n_0\
    );
\axil_read_data[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(11),
      I1 => ctrl_reg(11),
      I2 => out_sin_reg(11),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(11),
      O => \axil_read_data[11]_i_1_n_0\
    );
\axil_read_data[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(12),
      I1 => ctrl_reg(12),
      I2 => out_sin_reg(12),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(12),
      O => \axil_read_data[12]_i_1_n_0\
    );
\axil_read_data[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(13),
      I1 => ctrl_reg(13),
      I2 => out_sin_reg(13),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(13),
      O => \axil_read_data[13]_i_1_n_0\
    );
\axil_read_data[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(14),
      I1 => ctrl_reg(14),
      I2 => out_sin_reg(14),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(14),
      O => \axil_read_data[14]_i_1_n_0\
    );
\axil_read_data[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(15),
      I1 => ctrl_reg(15),
      I2 => out_sin_reg(15),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(15),
      O => \axil_read_data[15]_i_1_n_0\
    );
\axil_read_data[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(16),
      I1 => ctrl_reg(16),
      I2 => out_sin_reg(16),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(16),
      O => \axil_read_data[16]_i_1_n_0\
    );
\axil_read_data[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(17),
      I1 => ctrl_reg(17),
      I2 => out_sin_reg(17),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(17),
      O => \axil_read_data[17]_i_1_n_0\
    );
\axil_read_data[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(18),
      I1 => ctrl_reg(18),
      I2 => out_sin_reg(18),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(18),
      O => \axil_read_data[18]_i_1_n_0\
    );
\axil_read_data[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(19),
      I1 => ctrl_reg(19),
      I2 => out_sin_reg(19),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(19),
      O => \axil_read_data[19]_i_1_n_0\
    );
\axil_read_data[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(1),
      I1 => ctrl_reg(1),
      I2 => out_sin_reg(1),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(1),
      O => \axil_read_data[1]_i_1_n_0\
    );
\axil_read_data[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(20),
      I1 => ctrl_reg(20),
      I2 => out_sin_reg(20),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(20),
      O => \axil_read_data[20]_i_1_n_0\
    );
\axil_read_data[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(21),
      I1 => ctrl_reg(21),
      I2 => out_sin_reg(21),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(21),
      O => \axil_read_data[21]_i_1_n_0\
    );
\axil_read_data[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(22),
      I1 => ctrl_reg(22),
      I2 => out_sin_reg(22),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(22),
      O => \axil_read_data[22]_i_1_n_0\
    );
\axil_read_data[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(23),
      I1 => ctrl_reg(23),
      I2 => out_sin_reg(23),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(23),
      O => \axil_read_data[23]_i_1_n_0\
    );
\axil_read_data[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(24),
      I1 => ctrl_reg(24),
      I2 => out_sin_reg(24),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(24),
      O => \axil_read_data[24]_i_1_n_0\
    );
\axil_read_data[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(25),
      I1 => ctrl_reg(25),
      I2 => out_sin_reg(25),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(25),
      O => \axil_read_data[25]_i_1_n_0\
    );
\axil_read_data[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(26),
      I1 => ctrl_reg(26),
      I2 => out_sin_reg(26),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(26),
      O => \axil_read_data[26]_i_1_n_0\
    );
\axil_read_data[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(27),
      I1 => ctrl_reg(27),
      I2 => out_sin_reg(27),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(27),
      O => \axil_read_data[27]_i_1_n_0\
    );
\axil_read_data[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(28),
      I1 => ctrl_reg(28),
      I2 => out_sin_reg(28),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(28),
      O => \axil_read_data[28]_i_1_n_0\
    );
\axil_read_data[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(29),
      I1 => ctrl_reg(29),
      I2 => out_sin_reg(29),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(29),
      O => \axil_read_data[29]_i_1_n_0\
    );
\axil_read_data[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(2),
      I1 => ctrl_reg(2),
      I2 => out_sin_reg(2),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(2),
      O => \axil_read_data[2]_i_1_n_0\
    );
\axil_read_data[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(30),
      I1 => ctrl_reg(30),
      I2 => out_sin_reg(30),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(30),
      O => \axil_read_data[30]_i_1_n_0\
    );
\axil_read_data[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => \^axil_read_valid_reg_0\,
      I1 => S_AXI_ARVALID,
      I2 => S_AXI_ARESETN,
      O => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(31),
      I1 => ctrl_reg(31),
      I2 => out_sin_reg(31),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(31),
      O => \axil_read_data[31]_i_2_n_0\
    );
\axil_read_data[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(3),
      I1 => ctrl_reg(3),
      I2 => out_sin_reg(3),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(3),
      O => \axil_read_data[3]_i_1_n_0\
    );
\axil_read_data[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(4),
      I1 => ctrl_reg(4),
      I2 => out_sin_reg(4),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(4),
      O => \axil_read_data[4]_i_1_n_0\
    );
\axil_read_data[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(5),
      I1 => ctrl_reg(5),
      I2 => out_sin_reg(5),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(5),
      O => \axil_read_data[5]_i_1_n_0\
    );
\axil_read_data[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(6),
      I1 => ctrl_reg(6),
      I2 => out_sin_reg(6),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(6),
      O => \axil_read_data[6]_i_1_n_0\
    );
\axil_read_data[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(7),
      I1 => ctrl_reg(7),
      I2 => out_sin_reg(7),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(7),
      O => \axil_read_data[7]_i_1_n_0\
    );
\axil_read_data[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(8),
      I1 => ctrl_reg(8),
      I2 => out_sin_reg(8),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(8),
      O => \axil_read_data[8]_i_1_n_0\
    );
\axil_read_data[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_angle_reg(9),
      I1 => ctrl_reg(9),
      I2 => out_sin_reg(9),
      I3 => S_AXI_ARADDR(1),
      I4 => S_AXI_ARADDR(0),
      I5 => out_cos_reg(9),
      O => \axil_read_data[9]_i_1_n_0\
    );
\axil_read_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[0]_i_1_n_0\,
      Q => S_AXI_RDATA(0),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[10]_i_1_n_0\,
      Q => S_AXI_RDATA(10),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[11]_i_1_n_0\,
      Q => S_AXI_RDATA(11),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[12]_i_1_n_0\,
      Q => S_AXI_RDATA(12),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[13]_i_1_n_0\,
      Q => S_AXI_RDATA(13),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[14]_i_1_n_0\,
      Q => S_AXI_RDATA(14),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[15]_i_1_n_0\,
      Q => S_AXI_RDATA(15),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[16]_i_1_n_0\,
      Q => S_AXI_RDATA(16),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[17]_i_1_n_0\,
      Q => S_AXI_RDATA(17),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[18]_i_1_n_0\,
      Q => S_AXI_RDATA(18),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[19]_i_1_n_0\,
      Q => S_AXI_RDATA(19),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[1]_i_1_n_0\,
      Q => S_AXI_RDATA(1),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[20]_i_1_n_0\,
      Q => S_AXI_RDATA(20),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[21]_i_1_n_0\,
      Q => S_AXI_RDATA(21),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[22]_i_1_n_0\,
      Q => S_AXI_RDATA(22),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[23]_i_1_n_0\,
      Q => S_AXI_RDATA(23),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[24]_i_1_n_0\,
      Q => S_AXI_RDATA(24),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[25]_i_1_n_0\,
      Q => S_AXI_RDATA(25),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[26]_i_1_n_0\,
      Q => S_AXI_RDATA(26),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[27]_i_1_n_0\,
      Q => S_AXI_RDATA(27),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[28]_i_1_n_0\,
      Q => S_AXI_RDATA(28),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[29]_i_1_n_0\,
      Q => S_AXI_RDATA(29),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[2]_i_1_n_0\,
      Q => S_AXI_RDATA(2),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[30]_i_1_n_0\,
      Q => S_AXI_RDATA(30),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[31]_i_2_n_0\,
      Q => S_AXI_RDATA(31),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[3]_i_1_n_0\,
      Q => S_AXI_RDATA(3),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[4]_i_1_n_0\,
      Q => S_AXI_RDATA(4),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[5]_i_1_n_0\,
      Q => S_AXI_RDATA(5),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[6]_i_1_n_0\,
      Q => S_AXI_RDATA(6),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[7]_i_1_n_0\,
      Q => S_AXI_RDATA(7),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[8]_i_1_n_0\,
      Q => S_AXI_RDATA(8),
      R => \axil_read_data[31]_i_1_n_0\
    );
\axil_read_data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \axil_read_data[9]_i_1_n_0\,
      Q => S_AXI_RDATA(9),
      R => \axil_read_data[31]_i_1_n_0\
    );
axil_read_valid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5C00"
    )
        port map (
      I0 => S_AXI_RREADY,
      I1 => S_AXI_ARVALID,
      I2 => \^axil_read_valid_reg_0\,
      I3 => S_AXI_ARESETN,
      O => axil_read_valid_i_1_n_0
    );
axil_read_valid_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => axil_read_valid_i_1_n_0,
      Q => \^axil_read_valid_reg_0\,
      R => '0'
    );
\ctrl_reg[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => \^axil_awready_reg_0\,
      I1 => S_AXI_AWADDR(1),
      I2 => S_AXI_WSTRB(1),
      I3 => S_AXI_AWADDR(0),
      O => \ctrl_reg[15]_i_1_n_0\
    );
\ctrl_reg[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => \^axil_awready_reg_0\,
      I1 => S_AXI_AWADDR(1),
      I2 => S_AXI_WSTRB(2),
      I3 => S_AXI_AWADDR(0),
      O => \ctrl_reg[23]_i_1_n_0\
    );
\ctrl_reg[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => \^axil_awready_reg_0\,
      I1 => S_AXI_AWADDR(1),
      I2 => S_AXI_WSTRB(3),
      I3 => S_AXI_AWADDR(0),
      O => \ctrl_reg[31]_i_1_n_0\
    );
\ctrl_reg[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => \^axil_awready_reg_0\,
      I1 => S_AXI_AWADDR(1),
      I2 => S_AXI_WSTRB(0),
      I3 => S_AXI_AWADDR(0),
      O => \ctrl_reg[7]_i_1_n_0\
    );
\ctrl_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[7]_i_1_n_0\,
      D => S_AXI_WDATA(0),
      Q => ctrl_reg(0),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[15]_i_1_n_0\,
      D => S_AXI_WDATA(10),
      Q => ctrl_reg(10),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[15]_i_1_n_0\,
      D => S_AXI_WDATA(11),
      Q => ctrl_reg(11),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[15]_i_1_n_0\,
      D => S_AXI_WDATA(12),
      Q => ctrl_reg(12),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[15]_i_1_n_0\,
      D => S_AXI_WDATA(13),
      Q => ctrl_reg(13),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[15]_i_1_n_0\,
      D => S_AXI_WDATA(14),
      Q => ctrl_reg(14),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[15]_i_1_n_0\,
      D => S_AXI_WDATA(15),
      Q => ctrl_reg(15),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[23]_i_1_n_0\,
      D => S_AXI_WDATA(16),
      Q => ctrl_reg(16),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[23]_i_1_n_0\,
      D => S_AXI_WDATA(17),
      Q => ctrl_reg(17),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[23]_i_1_n_0\,
      D => S_AXI_WDATA(18),
      Q => ctrl_reg(18),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[23]_i_1_n_0\,
      D => S_AXI_WDATA(19),
      Q => ctrl_reg(19),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[7]_i_1_n_0\,
      D => S_AXI_WDATA(1),
      Q => ctrl_reg(1),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[23]_i_1_n_0\,
      D => S_AXI_WDATA(20),
      Q => ctrl_reg(20),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[23]_i_1_n_0\,
      D => S_AXI_WDATA(21),
      Q => ctrl_reg(21),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[23]_i_1_n_0\,
      D => S_AXI_WDATA(22),
      Q => ctrl_reg(22),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[23]_i_1_n_0\,
      D => S_AXI_WDATA(23),
      Q => ctrl_reg(23),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[31]_i_1_n_0\,
      D => S_AXI_WDATA(24),
      Q => ctrl_reg(24),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[31]_i_1_n_0\,
      D => S_AXI_WDATA(25),
      Q => ctrl_reg(25),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[31]_i_1_n_0\,
      D => S_AXI_WDATA(26),
      Q => ctrl_reg(26),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[31]_i_1_n_0\,
      D => S_AXI_WDATA(27),
      Q => ctrl_reg(27),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[31]_i_1_n_0\,
      D => S_AXI_WDATA(28),
      Q => ctrl_reg(28),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[31]_i_1_n_0\,
      D => S_AXI_WDATA(29),
      Q => ctrl_reg(29),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[7]_i_1_n_0\,
      D => S_AXI_WDATA(2),
      Q => ctrl_reg(2),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[31]_i_1_n_0\,
      D => S_AXI_WDATA(30),
      Q => ctrl_reg(30),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[31]_i_1_n_0\,
      D => S_AXI_WDATA(31),
      Q => ctrl_reg(31),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[7]_i_1_n_0\,
      D => S_AXI_WDATA(3),
      Q => ctrl_reg(3),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[7]_i_1_n_0\,
      D => S_AXI_WDATA(4),
      Q => ctrl_reg(4),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[7]_i_1_n_0\,
      D => S_AXI_WDATA(5),
      Q => ctrl_reg(5),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[7]_i_1_n_0\,
      D => S_AXI_WDATA(6),
      Q => ctrl_reg(6),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[7]_i_1_n_0\,
      D => S_AXI_WDATA(7),
      Q => ctrl_reg(7),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[15]_i_1_n_0\,
      D => S_AXI_WDATA(8),
      Q => ctrl_reg(8),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\ctrl_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \ctrl_reg[15]_i_1_n_0\,
      D => S_AXI_WDATA(9),
      Q => ctrl_reg(9),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => \^axil_awready_reg_0\,
      I1 => S_AXI_AWADDR(1),
      I2 => S_AXI_AWADDR(0),
      I3 => S_AXI_WSTRB(1),
      O => p_1_in(15)
    );
\in_angle_reg[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => \^axil_awready_reg_0\,
      I1 => S_AXI_AWADDR(1),
      I2 => S_AXI_AWADDR(0),
      I3 => S_AXI_WSTRB(2),
      O => p_1_in(23)
    );
\in_angle_reg[31]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => S_AXI_ARESETN,
      O => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => \^axil_awready_reg_0\,
      I1 => S_AXI_AWADDR(1),
      I2 => S_AXI_AWADDR(0),
      I3 => S_AXI_WSTRB(3),
      O => p_1_in(31)
    );
\in_angle_reg[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => \^axil_awready_reg_0\,
      I1 => S_AXI_AWADDR(1),
      I2 => S_AXI_AWADDR(0),
      I3 => S_AXI_WSTRB(0),
      O => p_1_in(7)
    );
\in_angle_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(7),
      D => S_AXI_WDATA(0),
      Q => in_angle_reg(0),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(15),
      D => S_AXI_WDATA(10),
      Q => in_angle_reg(10),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(15),
      D => S_AXI_WDATA(11),
      Q => in_angle_reg(11),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(15),
      D => S_AXI_WDATA(12),
      Q => in_angle_reg(12),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(15),
      D => S_AXI_WDATA(13),
      Q => in_angle_reg(13),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(15),
      D => S_AXI_WDATA(14),
      Q => in_angle_reg(14),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(15),
      D => S_AXI_WDATA(15),
      Q => in_angle_reg(15),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(23),
      D => S_AXI_WDATA(16),
      Q => in_angle_reg(16),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(23),
      D => S_AXI_WDATA(17),
      Q => in_angle_reg(17),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(23),
      D => S_AXI_WDATA(18),
      Q => in_angle_reg(18),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(23),
      D => S_AXI_WDATA(19),
      Q => in_angle_reg(19),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(7),
      D => S_AXI_WDATA(1),
      Q => in_angle_reg(1),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(23),
      D => S_AXI_WDATA(20),
      Q => in_angle_reg(20),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(23),
      D => S_AXI_WDATA(21),
      Q => in_angle_reg(21),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(23),
      D => S_AXI_WDATA(22),
      Q => in_angle_reg(22),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(23),
      D => S_AXI_WDATA(23),
      Q => in_angle_reg(23),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(31),
      D => S_AXI_WDATA(24),
      Q => in_angle_reg(24),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(31),
      D => S_AXI_WDATA(25),
      Q => in_angle_reg(25),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(31),
      D => S_AXI_WDATA(26),
      Q => in_angle_reg(26),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(31),
      D => S_AXI_WDATA(27),
      Q => in_angle_reg(27),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(31),
      D => S_AXI_WDATA(28),
      Q => in_angle_reg(28),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(31),
      D => S_AXI_WDATA(29),
      Q => in_angle_reg(29),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(7),
      D => S_AXI_WDATA(2),
      Q => in_angle_reg(2),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(31),
      D => S_AXI_WDATA(30),
      Q => in_angle_reg(30),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(31),
      D => S_AXI_WDATA(31),
      Q => in_angle_reg(31),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(7),
      D => S_AXI_WDATA(3),
      Q => in_angle_reg(3),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(7),
      D => S_AXI_WDATA(4),
      Q => in_angle_reg(4),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(7),
      D => S_AXI_WDATA(5),
      Q => in_angle_reg(5),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(7),
      D => S_AXI_WDATA(6),
      Q => in_angle_reg(6),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(7),
      D => S_AXI_WDATA(7),
      Q => in_angle_reg(7),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(15),
      D => S_AXI_WDATA(8),
      Q => in_angle_reg(8),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\in_angle_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_1_in(15),
      D => S_AXI_WDATA(9),
      Q => in_angle_reg(9),
      R => \in_angle_reg[31]_i_1_n_0\
    );
\out_cos_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(0),
      Q => out_cos_reg(0),
      R => '0'
    );
\out_cos_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(10),
      Q => out_cos_reg(10),
      R => '0'
    );
\out_cos_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(11),
      Q => out_cos_reg(11),
      R => '0'
    );
\out_cos_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(12),
      Q => out_cos_reg(12),
      R => '0'
    );
\out_cos_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(13),
      Q => out_cos_reg(13),
      R => '0'
    );
\out_cos_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(14),
      Q => out_cos_reg(14),
      R => '0'
    );
\out_cos_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(15),
      Q => out_cos_reg(15),
      R => '0'
    );
\out_cos_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(16),
      Q => out_cos_reg(16),
      R => '0'
    );
\out_cos_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(17),
      Q => out_cos_reg(17),
      R => '0'
    );
\out_cos_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(18),
      Q => out_cos_reg(18),
      R => '0'
    );
\out_cos_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(19),
      Q => out_cos_reg(19),
      R => '0'
    );
\out_cos_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(1),
      Q => out_cos_reg(1),
      R => '0'
    );
\out_cos_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(20),
      Q => out_cos_reg(20),
      R => '0'
    );
\out_cos_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(21),
      Q => out_cos_reg(21),
      R => '0'
    );
\out_cos_reg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(22),
      Q => out_cos_reg(22),
      R => '0'
    );
\out_cos_reg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(23),
      Q => out_cos_reg(23),
      R => '0'
    );
\out_cos_reg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(24),
      Q => out_cos_reg(24),
      R => '0'
    );
\out_cos_reg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(25),
      Q => out_cos_reg(25),
      R => '0'
    );
\out_cos_reg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(26),
      Q => out_cos_reg(26),
      R => '0'
    );
\out_cos_reg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(27),
      Q => out_cos_reg(27),
      R => '0'
    );
\out_cos_reg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(28),
      Q => out_cos_reg(28),
      R => '0'
    );
\out_cos_reg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(29),
      Q => out_cos_reg(29),
      R => '0'
    );
\out_cos_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(2),
      Q => out_cos_reg(2),
      R => '0'
    );
\out_cos_reg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(30),
      Q => out_cos_reg(30),
      R => '0'
    );
\out_cos_reg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(31),
      Q => out_cos_reg(31),
      R => '0'
    );
\out_cos_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(3),
      Q => out_cos_reg(3),
      R => '0'
    );
\out_cos_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(4),
      Q => out_cos_reg(4),
      R => '0'
    );
\out_cos_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(5),
      Q => out_cos_reg(5),
      R => '0'
    );
\out_cos_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(6),
      Q => out_cos_reg(6),
      R => '0'
    );
\out_cos_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(7),
      Q => out_cos_reg(7),
      R => '0'
    );
\out_cos_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(8),
      Q => out_cos_reg(8),
      R => '0'
    );
\out_cos_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => ctrl_reg(9),
      Q => out_cos_reg(9),
      R => '0'
    );
\out_sin_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(0),
      Q => out_sin_reg(0),
      R => '0'
    );
\out_sin_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(10),
      Q => out_sin_reg(10),
      R => '0'
    );
\out_sin_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(11),
      Q => out_sin_reg(11),
      R => '0'
    );
\out_sin_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(12),
      Q => out_sin_reg(12),
      R => '0'
    );
\out_sin_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(13),
      Q => out_sin_reg(13),
      R => '0'
    );
\out_sin_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(14),
      Q => out_sin_reg(14),
      R => '0'
    );
\out_sin_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(15),
      Q => out_sin_reg(15),
      R => '0'
    );
\out_sin_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(16),
      Q => out_sin_reg(16),
      R => '0'
    );
\out_sin_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(17),
      Q => out_sin_reg(17),
      R => '0'
    );
\out_sin_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(18),
      Q => out_sin_reg(18),
      R => '0'
    );
\out_sin_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(19),
      Q => out_sin_reg(19),
      R => '0'
    );
\out_sin_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(1),
      Q => out_sin_reg(1),
      R => '0'
    );
\out_sin_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(20),
      Q => out_sin_reg(20),
      R => '0'
    );
\out_sin_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(21),
      Q => out_sin_reg(21),
      R => '0'
    );
\out_sin_reg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(22),
      Q => out_sin_reg(22),
      R => '0'
    );
\out_sin_reg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(23),
      Q => out_sin_reg(23),
      R => '0'
    );
\out_sin_reg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(24),
      Q => out_sin_reg(24),
      R => '0'
    );
\out_sin_reg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(25),
      Q => out_sin_reg(25),
      R => '0'
    );
\out_sin_reg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(26),
      Q => out_sin_reg(26),
      R => '0'
    );
\out_sin_reg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(27),
      Q => out_sin_reg(27),
      R => '0'
    );
\out_sin_reg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(28),
      Q => out_sin_reg(28),
      R => '0'
    );
\out_sin_reg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(29),
      Q => out_sin_reg(29),
      R => '0'
    );
\out_sin_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(2),
      Q => out_sin_reg(2),
      R => '0'
    );
\out_sin_reg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(30),
      Q => out_sin_reg(30),
      R => '0'
    );
\out_sin_reg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(31),
      Q => out_sin_reg(31),
      R => '0'
    );
\out_sin_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(3),
      Q => out_sin_reg(3),
      R => '0'
    );
\out_sin_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(4),
      Q => out_sin_reg(4),
      R => '0'
    );
\out_sin_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(5),
      Q => out_sin_reg(5),
      R => '0'
    );
\out_sin_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(6),
      Q => out_sin_reg(6),
      R => '0'
    );
\out_sin_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(7),
      Q => out_sin_reg(7),
      R => '0'
    );
\out_sin_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(8),
      Q => out_sin_reg(8),
      R => '0'
    );
\out_sin_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => in_angle_reg(9),
      Q => out_sin_reg(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axil_0_0 is
  port (
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_axil_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_axil_0_0 : entity is "design_1_axil_0_0,axil,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_axil_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_axil_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_axil_0_0 : entity is "axil,Vivado 2024.1";
end design_1_axil_0_0;

architecture STRUCTURE of design_1_axil_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^s_axi_wready\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of S_AXI_ACLK : signal is "xilinx.com:signal:clock:1.0 S_AXI_ACLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of S_AXI_ACLK : signal is "XIL_INTERFACENAME S_AXI_ACLK, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET S_AXI_ARESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of S_AXI_ARESETN : signal is "xilinx.com:signal:reset:1.0 S_AXI_ARESETN RST";
  attribute X_INTERFACE_PARAMETER of S_AXI_ARESETN : signal is "XIL_INTERFACENAME S_AXI_ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of S_AXI_ARREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARREADY";
  attribute X_INTERFACE_INFO of S_AXI_ARVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARVALID";
  attribute X_INTERFACE_INFO of S_AXI_AWREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWREADY";
  attribute X_INTERFACE_INFO of S_AXI_AWVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWVALID";
  attribute X_INTERFACE_INFO of S_AXI_BREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI BREADY";
  attribute X_INTERFACE_INFO of S_AXI_BVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
  attribute X_INTERFACE_INFO of S_AXI_RREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI RREADY";
  attribute X_INTERFACE_PARAMETER of S_AXI_RREADY : signal is "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of S_AXI_RVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
  attribute X_INTERFACE_INFO of S_AXI_WREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI WREADY";
  attribute X_INTERFACE_INFO of S_AXI_WVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI WVALID";
  attribute X_INTERFACE_INFO of S_AXI_ARADDR : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARADDR";
  attribute X_INTERFACE_INFO of S_AXI_AWADDR : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWADDR";
  attribute X_INTERFACE_INFO of S_AXI_BRESP : signal is "xilinx.com:interface:aximm:1.0 S_AXI BRESP";
  attribute X_INTERFACE_INFO of S_AXI_RDATA : signal is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of S_AXI_RRESP : signal is "xilinx.com:interface:aximm:1.0 S_AXI RRESP";
  attribute X_INTERFACE_INFO of S_AXI_WDATA : signal is "xilinx.com:interface:aximm:1.0 S_AXI WDATA";
  attribute X_INTERFACE_INFO of S_AXI_WSTRB : signal is "xilinx.com:interface:aximm:1.0 S_AXI WSTRB";
begin
  S_AXI_AWREADY <= \^s_axi_wready\;
  S_AXI_BRESP(1) <= \<const0>\;
  S_AXI_BRESP(0) <= \<const0>\;
  S_AXI_RRESP(1) <= \<const0>\;
  S_AXI_RRESP(0) <= \<const0>\;
  S_AXI_WREADY <= \^s_axi_wready\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.design_1_axil_0_0_axil
     port map (
      S_AXI_ACLK => S_AXI_ACLK,
      S_AXI_ARADDR(1 downto 0) => S_AXI_ARADDR(3 downto 2),
      S_AXI_ARESETN => S_AXI_ARESETN,
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_ARVALID => S_AXI_ARVALID,
      S_AXI_AWADDR(1 downto 0) => S_AXI_AWADDR(3 downto 2),
      S_AXI_AWVALID => S_AXI_AWVALID,
      S_AXI_BREADY => S_AXI_BREADY,
      S_AXI_BVALID => S_AXI_BVALID,
      S_AXI_RDATA(31 downto 0) => S_AXI_RDATA(31 downto 0),
      S_AXI_RREADY => S_AXI_RREADY,
      S_AXI_WDATA(31 downto 0) => S_AXI_WDATA(31 downto 0),
      S_AXI_WSTRB(3 downto 0) => S_AXI_WSTRB(3 downto 0),
      S_AXI_WVALID => S_AXI_WVALID,
      axil_awready_reg_0 => \^s_axi_wready\,
      axil_read_valid_reg_0 => S_AXI_RVALID
    );
end STRUCTURE;
