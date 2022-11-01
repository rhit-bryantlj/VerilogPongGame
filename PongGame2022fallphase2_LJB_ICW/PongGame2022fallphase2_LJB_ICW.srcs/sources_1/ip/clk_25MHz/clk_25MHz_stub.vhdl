-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Mon Oct 31 17:51:56 2022
-- Host        : RHIT-R90VFCAK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/SeniorFallQuarter/AdvVerilog/Projects/PongGame2022fallphase2_LJB_ICW/PongGame2022fallphase2_LJB_ICW.srcs/sources_1/ip/clk_25MHz/clk_25MHz_stub.vhdl
-- Design      : clk_25MHz
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_25MHz is
  Port ( 
    clk_out25Mhz : out STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in100Mhz : in STD_LOGIC
  );

end clk_25MHz;

architecture stub of clk_25MHz is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out25Mhz,locked,clk_in100Mhz";
begin
end;
