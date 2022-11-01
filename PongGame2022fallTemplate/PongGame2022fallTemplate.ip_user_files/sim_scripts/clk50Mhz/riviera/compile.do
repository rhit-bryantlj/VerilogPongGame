vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../ipstatic" \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic" \
"../../../../PongGame2022fallTemplate.srcs/sources_1/ip/clk50Mhz/clk50Mhz_clk_wiz.v" \
"../../../../PongGame2022fallTemplate.srcs/sources_1/ip/clk50Mhz/clk50Mhz.v" \

vlog -work xil_defaultlib \
"glbl.v"

