`timescale 1ns / 1ps
//File: vsyncModule2022fallTemplate.v
//To be completed by students. Add your name and date after you have revised this file
//Author: Logan Bryant & Isabel Wilson
//Date: October 31, 2022
//ECE433 Fall 2022
//The line increment is synchronized with the hsync pulse
//synch pulse is generated at the end of the line: Active Video-BackPorch-SynchPulse-FrontPorch
//this is how it is done by the video timer of the pong game
//LineEnd and FrameEnd are ANDed to restart frame

module vsyncModule2022fallTemplate #(parameter yresolution=10)(
input [yresolution-1:0] SynchPulse, BackPorch, ActiveVideo, FrontPorch, 
input reset, clock, LineEnd, 
output vsync, output reg [yresolution-1:0] yposition);

wire [yresolution-1:0] ycount;
wire EndYLine;

FallingEdgePositiveOneShot LineEndUnit(reset,clock, LineEnd, LineEndOneShot);

wire[yresolution-1:0] EndCount = SynchPulse+FrontPorch+ActiveVideo+BackPorch;
assign EndYLine = ycount==EndCount;
//synch pulse appears at the end of the line and after front porch to mimic the pong video_timer
// ysync <= ~(ypos > 490 && ypos <=491); //
assign vsync = ~(ycount>=(ActiveVideo+FrontPorch)&&ycount<=(ActiveVideo+FrontPorch+SynchPulse));
always@(*)
yposition<=ycount; // game circuit does not work if ypos does not run from 0 to 
//module UniversalCounter2022fall #(parameter length = 10) (
//input	[length-1:0] P, BeginCount, EndCount, 
//input Reset, CLOCK, S1,S0,
//output 	reg [length-1:0] count_value,
//output reg TerminalCount);

UniversalCounter2022fall YPositionCounter(
10'd0, 10'd0,EndCount, reset, clock, EndYLine,EndYLine || LineEndOneShot, ycount, );

endmodule
