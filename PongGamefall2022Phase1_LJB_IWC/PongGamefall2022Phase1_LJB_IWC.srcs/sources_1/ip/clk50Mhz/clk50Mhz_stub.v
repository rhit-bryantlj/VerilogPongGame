// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Oct 31 09:17:23 2022
// Host        : RHIT-R90VFCAK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/SeniorFallQuarter/AdvVerilog/Projects/PongGamefall2022Phase1_LJB_IWC/PongGamefall2022Phase1_LJB_IWC.srcs/sources_1/ip/clk50Mhz/clk50Mhz_stub.v
// Design      : clk50Mhz
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk50Mhz(clk_out50Mhz, locked, clk_in100Mhz)
/* synthesis syn_black_box black_box_pad_pin="clk_out50Mhz,locked,clk_in100Mhz" */;
  output clk_out50Mhz;
  output locked;
  input clk_in100Mhz;
endmodule
