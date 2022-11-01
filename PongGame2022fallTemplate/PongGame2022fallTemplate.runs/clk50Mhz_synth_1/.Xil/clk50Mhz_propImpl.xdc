set_property SRC_FILE_INFO {cfile:c:/SeniorFallQuarter/AdvVerilog/Projects/PongGame2022fallTemplate/PongGame2022fallTemplate.srcs/sources_1/ip/clk50Mhz/clk50Mhz.xdc rfile:../../../PongGame2022fallTemplate.srcs/sources_1/ip/clk50Mhz/clk50Mhz.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in100Mhz]] 0.1
