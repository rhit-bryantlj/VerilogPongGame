-makelib xcelium_lib/xpm -sv \
  "C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../PongGame2022fallTemplate.srcs/sources_1/ip/clk50Mhz/clk50Mhz_clk_wiz.v" \
  "../../../../PongGame2022fallTemplate.srcs/sources_1/ip/clk50Mhz/clk50Mhz.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

