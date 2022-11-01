`timescale 1ns / 1ps
///File: PongGame2022fallTemplate.v
//Date: October 30, 2022

//pong game with new controller template
//ECE433-01 Fall 2022
//Term Project VGA driver template
//the video controller uses synch timings from the pong game
//the system clock should be 100MHz
//the VGA pixel clock is 25MHz
//this is a template for students to complete
//try to match the video_timer
//based on pong from http://www.bigmessowires.com/2009/06/21/fpga-pong/. 

module PongGame2022fallTemplate(
    input Reset, Clock, rota, rotb,  
    output [3:0] red, green, blue,
    output hsync, vsync
    );

wire [9:0] xpos;
wire [9:0] ypos;

parameter [9:0] NumberofPixels=10'd640, NumberofLines=10'd480;
parameter [9:0] SystemClock=10'd100, CRTClock=10'd25; //MHz 

//module CRTcontroller2022fall #(parameter ResolutionSize=10, SystemClockSize=10) (
//input [SystemClockSize-1:0] SystemClockFreq, CRTClockFreq, 
//input reset, clock, 
//input [ResolutionSize-1:0] Xresolution, Yresolution,
//output hsync, vsync, 
//output [ResolutionSize-1:0] xpos, ypos);

CRTcontroller2022fall VGAdisplay(SystemClock, CRTClock, Reset, Clock, 
     NumberofPixels, NumberofLines, hsync, vsync, xpos, ypos);
	  
//module game2022fall_JJS(
//input Reset, clk25, rota, rotb,
//input [9:0] xpos, ypos,
//output [3:0] red, green, blue);

//change the name of this module to include your names
game2022fallTemplate gameUnit(Reset,Clock, rota, rotb, xpos, ypos, red, green, blue);
					
endmodule
