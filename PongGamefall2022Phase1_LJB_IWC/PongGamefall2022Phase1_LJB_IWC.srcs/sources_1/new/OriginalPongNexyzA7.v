`timescale 1ns / 1ps
//from http://www.bigmessowires.com/2009/06/21/fpga-pong/
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:41:47 06/21/2009 
// Design Name: 
// Module Name:    OriginalPongNexyzA7
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

// -----------------------------------------------
// 640x480 @ 60Hz, from a 25MHz input clock
// line duration is slightly longer than spec, but 
// number of lines is fewer to compensate
// -----------------------------------------------
module video_timer(input clk25, reset,
						 output hsyncOut,
						 output vsyncOut,
						 output [9:0] xposOut,
						 output [9:0] yposOut);

reg [9:0] xpos;
reg [9:0] ypos;

wire endline = (xpos == 799);

always @(posedge clk25 or posedge reset) begin
	if (endline || reset)
	  xpos <= 0;
	else
	  xpos <= xpos + 1;
end

always @(posedge clk25 or posedge reset) begin
    if (reset) ypos <= 0;
    else
        if (endline) begin
            if (ypos == 520)
                ypos <= 0;
            else
                ypos <= ypos + 1;	
        end
end
	 
reg hsync, vsync;
always @(posedge clk25 or posedge reset) begin
    if(reset == 1)begin
        hsync <= 0;
        vsync <= 0;
        end
    else begin
	hsync <= ~(xpos > 664 && xpos <= 759);  // active for 96 clocks
	vsync <= ~(ypos == 490 || ypos == 491);   // active for lines 490 and 491
	end
end

assign hsyncOut = hsync;
assign vsyncOut = vsync;
assign xposOut = xpos;
assign yposOut = ypos;

endmodule


// -----------------------------------------------
// updates the ball and paddle positions, and
// determines the output video image
// -----------------------------------------------
module game(input clk25, reset,
				input [9:0] xpos,
				input [9:0] ypos,
				input rota,
				input rotb,
				output [3:0] red,
				output [3:0] green,
				output [3:0] blue);
		
// paddle movement		
reg [8:0] paddlePosition;
reg [2:0] quadAr, quadBr;
always @(posedge clk25 or posedge reset)begin
    if(reset) quadAr <= 3'b0;
    else quadAr <= {quadAr[1:0], rota};
end
always @(posedge clk25 or posedge reset)begin
    if(reset) quadBr <= 0;
    else quadBr <= {quadBr[1:0], rotb};
end

always @(posedge clk25 or posedge reset)
if(reset)begin
    paddlePosition <= 254;
end
else
if(quadAr[2] ^ quadAr[1] ^ quadBr[2] ^ quadBr[1])
begin
	if(quadAr[2] ^ quadBr[1]) begin
		if(paddlePosition < 508)        // make sure the value doesn't overflow
			paddlePosition <= paddlePosition + 4;
	end
	else begin
		if(paddlePosition > 3)        // make sure the value doesn't underflow
			paddlePosition <= paddlePosition - 4;
	end
end
		
// ball movement	
reg [9:0] ballX;
reg [8:0] ballY;
reg ballXdir, ballYdir;
reg bounceX, bounceY;
	
wire endOfFrame = (xpos == 0 && ypos == 480);
	
always @(posedge clk25 or posedge reset) begin
    if(reset) begin
        ballX <= 480;
        ballY <= 300;
        end
    else
	if (endOfFrame) begin // update ball position at end of each frame
		if (ballX == 0 && ballY == 0) begin // cheesy reset handling, assumes initial value of 0
			ballX <= 480;
			ballY <= 300;
		end
		else begin
			if (ballXdir ^ bounceX) 
				ballX <= ballX + 2;
			else 
				ballX <= ballX - 2;	

			if (ballYdir ^ bounceY) 
				ballY <= ballY + 2;
			else
				ballY <= ballY - 2;	
		end
	end	
end		
		
// pixel color	
reg [5:0] missTimer;	
wire visible = (xpos < 640 && ypos < 480);
wire top = (visible && ypos <= 3);
wire bottom = (visible && ypos >= 476);
wire left = (visible && xpos <= 3);
wire right = (visible && xpos >= 636);
wire border = (visible && (left || right || top));
wire paddle = (xpos >= paddlePosition+4 && xpos <= paddlePosition+124 && ypos >= 440 && ypos <= 447);
wire ball = (xpos >= ballX && xpos <= ballX+7 && ypos >= ballY && ypos <= ballY+7);
wire background = (visible && !(border || paddle || ball));
wire checkerboard = (xpos[5] ^ ypos[5]);
wire missed = visible && missTimer != 0;

assign red   = { missed || border || paddle, 3'b000 };
assign green = { !missed && (border || paddle || ball), 3'b000 };
assign blue  = { !missed && (border || ball), background && checkerboard, background && !checkerboard, background && !checkerboard  }; 
		
// ball collision	
always @(posedge clk25 or posedge reset) begin
    if (reset) begin
        ballXdir <= 1;
		ballYdir <= 1;
		bounceX <= 0;
		bounceY <= 0;
		missTimer <= 0;
        end
    else
	if (!endOfFrame) begin
		if (ball && (left || right))
			bounceX <= 1;
		if (ball && (top || bottom || (paddle && ballYdir)))
			bounceY <= 1;
		if (ball && bottom)
			missTimer <= 63;
	end
	else begin
		if (ballX == 0 && ballY == 0) begin // cheesy reset handling, assumes initial value of 0
			ballXdir <= 1;
			ballYdir <= 1;
			bounceX <= 0;
			bounceY <= 0;
		end 
		else begin
			if (bounceX)
				ballXdir <= ~ballXdir;
			if (bounceY)
				ballYdir <= ~ballYdir;			
			bounceX <= 0;
			bounceY <= 0;
			if (missTimer != 0)
				missTimer <= missTimer - 1;
		end
	end
end
		
endmodule


// -----------------------------------------------
// top-level module
// -----------------------------------------------
module pong(
    input clk100Mhz,
    input reset,
    input rota,
    input rotb,
    output clockLocked,
    output [3:0] red,
    output [3:0] green,
    output [3:0] blue,
    output hsync,
    output vsync
    );
wire clk50;
clk50Mhz SystemClockUnit(.clk_in100Mhz(clk100Mhz),.clk_out50Mhz(clk50),.locked(clockLocked));
// divide input clock by two, and use a global 
// clock buffer for the derived clock
reg clk25_int;
always @(posedge clk50) begin
	clk25_int <= ~clk25_int;
end
wire clk25;
BUFG bufg_inst(clk25, clk25_int);

wire [9:0] xpos;
wire [9:0] ypos;

video_timer video_timer_inst(clk25,reset, hsync, vsync, xpos, ypos);
game game_inst(clk25, reset, xpos, ypos, rota, rotb, red, green, blue);
					
endmodule
