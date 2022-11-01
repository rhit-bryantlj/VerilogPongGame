-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Mon Oct 31 09:16:18 2022
-- Host        : RHIT-R90VFCAK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/SeniorFallQuarter/AdvVerilog/Projects/PongGame2022fallTemplate/PongGame2022fallTemplate.srcs/sources_1/ip/clk50Mhz/clk50Mhz_stub.vhdl
-- Design      : clk50Mhz
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk50Mhz is
  Port ( 
    clk_out50Mhz : out STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in100Mhz : in STD_LOGIC
  );

end clk50Mhz;

architecture stub of clk50Mhz is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out50Mhz,locked,clk_in100Mhz";
begin
end;
