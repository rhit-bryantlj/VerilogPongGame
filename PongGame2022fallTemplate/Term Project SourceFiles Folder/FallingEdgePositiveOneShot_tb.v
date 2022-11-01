`timescale 1ns / 1ps
//ECE433 Fall 2022

module FallingEdgePositiveOneShot_tb;
reg X, Reset, CLOCK;
wire OneShot;

 //module FallingEdgePositiveOneShot(input Reset, CLOCK,  InputPulse, output reg OneShot);
     
	FallingEdgePositiveOneShot OneShotChip(Reset, CLOCK, X, OneShot);
	
	initial begin #0 CLOCK=0; end	//initial value for input CLOCK

	initial fork	//absolute time instances
		#0  Reset=1; #13 Reset = 0;     #57 Reset=1; #76 Reset=0;
		#0 X=1;   #15 X=0; #50 X=1;   #60 X=0;  #79 X=1;  #89 X=0;  #120 X=1; 
		#145 X=0;  #178 X=1;
		#200 $stop;
	join

always #5 CLOCK=~CLOCK;	//generate a periodic signal as clock
endmodule

