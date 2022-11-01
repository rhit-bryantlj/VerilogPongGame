// File name	: UniversalCounter2022fall.v
// Written by	: Jianjian Song
// ECE433 Fall 2022
// 4-bit universal bidirectional counter
`timescale 1ns / 1ps

module UniversalCounter2022fall #(parameter length = 10) (
input	[length-1:0] P, BeginCount, EndCount, 
input Reset, CLOCK, S1,S0,
output 	reg [length-1:0] count_value,
output reg TerminalCount);
//TerminalCount=1 when the counter wraps around

parameter HOLD=2'd0, UP=2'd1, DOWN=2'd2, LOAD=2'd3;

reg	[length-1:0]	NextQ;

always @ (posedge CLOCK or posedge Reset)
	if(Reset==1)	count_value <= BeginCount; else	count_value<=NextQ;

always@(count_value or S1 or S0 or P or EndCount or BeginCount)
	case ({S1,S0})
	HOLD:	begin NextQ <= count_value; TerminalCount<=0; end // hold
	UP:	begin if (count_value>=EndCount) begin TerminalCount<=1; NextQ<=BeginCount; end
		else begin TerminalCount<=0; NextQ <= count_value+1'b1;	end
		end // count up
	DOWN:	begin if (count_value==BeginCount) begin TerminalCount<=1; NextQ<=EndCount; end
		else begin TerminalCount<=0; NextQ <= count_value-1'b1;	end
		end // count down
	LOAD:	begin NextQ <= P; TerminalCount<=1'b0; end	// parallel load
	endcase
endmodule
