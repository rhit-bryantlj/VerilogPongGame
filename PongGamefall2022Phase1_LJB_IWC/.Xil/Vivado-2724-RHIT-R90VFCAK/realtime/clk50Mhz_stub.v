// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk50Mhz(clk_out50Mhz, locked, clk_in100Mhz);
  output clk_out50Mhz;
  output locked;
  input clk_in100Mhz;
endmodule
