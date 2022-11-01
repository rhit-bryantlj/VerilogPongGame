onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+clk50Mhz -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.clk50Mhz xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {clk50Mhz.udo}

run -all

endsim

quit -force
