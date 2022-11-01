// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Oct 31 17:51:56 2022
// Host        : RHIT-R90VFCAK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/SeniorFallQuarter/AdvVerilog/Projects/PongGame2022fallphase2_LJB_ICW/PongGame2022fallphase2_LJB_ICW.srcs/sources_1/ip/clk_25MHz/clk_25MHz_stub.v
// Design      : clk_25MHz
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_25MHz(clk_out25Mhz, locked, clk_in100Mhz)
/* synthesis syn_black_box black_box_pad_pin="clk_out25Mhz,locked,clk_in100Mhz" */;
  output clk_out25Mhz;
  output locked;
  input clk_in100Mhz;
endmodule
