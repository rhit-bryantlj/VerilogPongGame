// File name	: FallingEdgePositiveOneShot.v
// Written by	: Jianjian Song
//ECE433 Fall 2022
// Generate one postive shot from the falling edge of the input pulse
`timescale 1ns / 1ps

module FallingEdgePositiveOneShot(input Reset, CLOCK, InputPulse, output reg OneShot);

parameter Initial=0, OneShotState=1, IdleState=2, WaitState=3;
reg [1:0] State;

always@(State)
	if(State==OneShotState) OneShot<=1; else OneShot<=0;

always @ (posedge CLOCK)
	if(Reset==1)	State <= Initial; else
	case (State)
	Initial:	if (InputPulse==1) State<=Initial; else State<=OneShotState;
	OneShotState:	if (InputPulse==1) State<=Initial; else State<=WaitState;
	IdleState:	State<=Initial;
	WaitState:	if (InputPulse==1) State<=Initial; else State<=WaitState;
	endcase
endmodule
