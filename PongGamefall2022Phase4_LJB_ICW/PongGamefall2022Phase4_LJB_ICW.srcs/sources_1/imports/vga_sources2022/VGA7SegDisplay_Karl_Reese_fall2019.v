`timescale 1ns / 1ps
//File Name: VGA7SegDisplay_Karl_Reese_fall2019.v
//Author: Chris Miller
//Revisedd by Karl Reese Fall 2019
//Date: October, 2019
//Purpose: Generate seven-segment display with pixels on VGA display
//input:  
// (digitXPosition, digitYPosition): upper left corner of the display
// (xpos, ypos): screen position where pixel digitpixel is located
// digit: decimal number to be displayed
// output
// digitpixel: 1-bit ON or OFF flag for pixel at (xpos, ypos)

module VGA7SegDisplay #(parameter DIGIT_WIDTH=10'd20, DIGIT_HEIGHT=10'd28, LINE_WIDTH=10'd4) (input [9:0] digitXPosition, digitYPosition, xpos, ypos,
						input [3:0] digit,
						output reg digitpixel
    );

wire segmentA = (xpos >= digitXPosition+LINE_WIDTH && xpos <= digitXPosition+DIGIT_WIDTH-LINE_WIDTH && ypos >= digitYPosition && ypos <= digitYPosition+LINE_WIDTH-1);
wire segmentB = (xpos >= digitXPosition+DIGIT_WIDTH-LINE_WIDTH && xpos <= digitXPosition+DIGIT_WIDTH-1 && ypos >= digitYPosition+LINE_WIDTH && ypos <= digitYPosition+DIGIT_HEIGHT/2-2);
wire segmentC = (xpos >= digitXPosition+DIGIT_WIDTH-LINE_WIDTH && xpos <= digitXPosition+DIGIT_WIDTH-1 && ypos >= digitYPosition+DIGIT_HEIGHT/2+2 && ypos <= digitYPosition+DIGIT_HEIGHT-1-LINE_WIDTH);
wire segmentD = (xpos >= digitXPosition+LINE_WIDTH && xpos <= digitXPosition+DIGIT_WIDTH-LINE_WIDTH && ypos >= digitYPosition+DIGIT_HEIGHT-LINE_WIDTH && ypos <= digitYPosition+DIGIT_HEIGHT-1);
wire segmentE = (xpos >= digitXPosition && xpos <= digitXPosition+LINE_WIDTH-1 && ypos >= digitYPosition+DIGIT_HEIGHT/2+2 && ypos <= digitYPosition+DIGIT_HEIGHT-1-LINE_WIDTH);
wire segmentF = (xpos >= digitXPosition && xpos <= digitXPosition+LINE_WIDTH-1 && ypos >= digitYPosition+LINE_WIDTH && ypos <= digitYPosition+DIGIT_HEIGHT/2-2);
wire segmentG = (xpos >= digitXPosition+LINE_WIDTH && xpos <= digitXPosition+DIGIT_WIDTH-LINE_WIDTH-1 && ypos >= digitYPosition+(DIGIT_HEIGHT-LINE_WIDTH)/2 && ypos <= digitYPosition+(DIGIT_HEIGHT+LINE_WIDTH)/2);

always @(digit,segmentA,segmentA,segmentB,segmentC,segmentD,segmentE,segmentF,segmentG)
	case (digit) 
		0:	digitpixel <= (segmentA | segmentB | segmentC | segmentD | segmentE | segmentF );
		1:	digitpixel <= (segmentB | segmentC );
		2:	digitpixel <= (segmentA | segmentB | segmentD | segmentE | segmentG );
		3:	digitpixel <= (segmentA | segmentB | segmentC | segmentD | segmentG );
		4:	digitpixel <= (segmentB | segmentC | segmentF | segmentG );
		5:	digitpixel <= (segmentA | segmentC | segmentD | segmentF | segmentG );
		6:	digitpixel <= (segmentA | segmentC | segmentD | segmentE | segmentF | segmentG );
		7:	digitpixel <= (segmentA | segmentB | segmentC );
		8:	digitpixel <= (segmentA | segmentB | segmentC | segmentD | segmentE | segmentF | segmentG );
		9:	digitpixel <= (segmentA | segmentB | segmentC | segmentD | segmentF | segmentG );
		10:	digitpixel <= (segmentA | segmentB | segmentC | segmentE | segmentF | segmentG );
		default: digitpixel <= 0;
	endcase
endmodule
