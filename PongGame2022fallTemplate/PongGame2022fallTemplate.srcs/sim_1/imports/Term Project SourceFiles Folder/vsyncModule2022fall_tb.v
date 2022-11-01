`timescale 1ns / 1ps
//ECE 433 Fall 2022
module vsyncModule2022fall_tb;

	reg LineEnd, reset, clock;
	reg [9:0] SynchPulse, FrontPorch, ActiveVideo, BackPorch;

	wire vsync;
	wire [9:0] yposition;
//module vsyncModule2022fall #(parameter yresolution=10)(
//input [yresolution-1:0] SynchPulse, BackPorch, ActiveVideo, FrontPorch, 
//input reset, clock, LineEnd, 
//output vsync, output [yresolution-1:0] yposition);

	vsyncModule2022fallTemplate uut (SynchPulse,  BackPorch, ActiveVideo, 
	FrontPorch, reset, clock, LineEnd, vsync, yposition);
	
  initial begin
	 ActiveVideo = 6;   FrontPorch = 2;  SynchPulse = 3;  BackPorch = 2;   
	 reset = 0; clock = 0;    LineEnd=0; 
    end
  always #1 clock=~clock;
  always #6 LineEnd=~LineEnd;
  initial fork
	 #0 reset=1; 	#12 reset=0; 
     #300 $stop;
  join
endmodule

