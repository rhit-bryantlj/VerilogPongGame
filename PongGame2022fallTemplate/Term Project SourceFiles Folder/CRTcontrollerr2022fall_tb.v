`timescale 1ns / 1ps

module CRTcontroller2022fall_tb;

	reg [9:0] Xresolution, Yresolution;
	reg [9:0] SystemClock, CRTClock;
	reg reset, clock;

	wire hsync, vsync;
	wire [9:0] xposition, yposition;
	wire PixelClock=uut.PixelClock;

//module CRTcontroller2022fall #(parameter ResolutionSize=10, SystemClockSize=10) (
//input [SystemClockSize-1:0] SystemClockFreq, CRTClockFreq, 
//input reset, clock, 
//input [ResolutionSize-1:0] Xresolution, Yresolution,
//output hsync, vsync, 
//output [ResolutionSize-1:0] xpos, ypos);

	CRTcontroller2022fall uut (
	SystemClock, CRTClock, reset, clock, Xresolution, Yresolution, hsync, 
	vsync, xposition, yposition);

	initial begin
		// Initialize Inputs
		Xresolution = 10;
		Yresolution = 4;
		SystemClock = 10;
		CRTClock=2;
		reset = 0;
		clock=0;
	end
	always #1 clock=~clock;
	initial fork
	#0 reset=1; 	#5 reset=0; 
   #1200 $stop;
	join
      
endmodule

