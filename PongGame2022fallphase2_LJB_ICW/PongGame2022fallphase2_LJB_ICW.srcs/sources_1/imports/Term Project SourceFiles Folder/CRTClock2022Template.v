`timescale 1ns / 1ps
//File: CRTClock2022fallTemplate.v
//Generate 25MHz VGA clock from a SystemClock
//SystemClockFreq and CRTClockFreq are input parameters in MHz
//ECE433-01 Fall 2022
//Term Project on Pong game on VGA
//Author: Logan Bryant & Isabel Wilson
//Date: November 1, 2022
//ECE433 Fall 2022
//Takes in given input clock and creates output clock with specified frequency

module CRTClock2022fallTemplate #(parameter SystemClockSize=10)(
input [SystemClockSize-1:0] SystemClockFreq, CRTClockFreq, input Reset, Clock,
output reg PixelClock);
reg [SystemClockSize-1:0] ticksPerHalfPeriod;
wire halfPeriod;
//a counter is needed to generate PixelClock
//module UniversalCounter2022fall #(parameter length = 10) (
//input	[length-1:0] P, BeginCount, EndCount, 
//input Reset, CLOCK, S1,S0,
//output 	reg [length-1:0] count_value,
//output reg TerminalCount);
UniversalCounter2022fall pixelClockCounter( , 11'd0, ticksPerHalfPeriod-1, Reset, 
    Clock, 1'b0, 1'b1, ,halfPeriod);
    
always@(SystemClockFreq or CRTClockFreq)
    ticksPerHalfPeriod <= (SystemClockFreq/CRTClockFreq)/2;
    
always@(posedge halfPeriod or posedge Reset)
    if(Reset == 1) PixelClock <=0;
    else PixelClock <= ~PixelClock;

endmodule

