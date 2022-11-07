`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2022 09:34:38 PM
// Design Name: 
// Module Name: scoreCounter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module scoreCounter(input inc, Clock, Reset, missed, output [3:0] scoretens, scoreones);

//module UniversalCounter2022fall #(parameter length = 10) (
//input	[length-1:0] P, BeginCount, EndCount, 
//input Reset, CLOCK, S1,S0,
//output 	reg [length-1:0] count_value,
//output reg TerminalCount)
wire termCount;
wire missed1s;
wire inc1s;
//module PositiveClockedOneShot(InputPulse, OneShot, Reset, CLOCK) ;
PositiveClockedOneShot missedOneShot(missed, missed1s, Reset, Clock);
PositiveClockedOneShot incOneShot(inc, inc1s, Reset, Clock);

UniversalCounter2022fall onesCounter( 0, 0, 9, Reset, Clock, missed1s, inc1s | missed1s, scoreones, termCount);
UniversalCounter2022fall tensCounter( 0, 0, 9, Reset, Clock, missed1s, termCount | missed1s, scoretens, );


endmodule
