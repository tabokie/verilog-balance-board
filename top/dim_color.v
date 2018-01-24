`include "head.v"
module dim_color(
	input clk,
	input rst,
	input [9:0] col_addr,
	input [8:0] row_addr,
	input [11:0] pri_color,
	output reg [11:0] color
);

	wire [17:0] x;
	wire [17:0] y;
	assign x = {8'b0,col_addr} + ~18'd320 + 18'd1;
	assign y = {9'b0,row_addr} + ~18'd240 + 18'd1;
	wire [17:0] ux;
	wire [17:0] uy;
	assign ux = (x[17]==1'b1) ? ~x+18'd1 : x;
	assign uy = (y[17]==1'b1) ? ~y+18'd1 : y;

	reg [17:0] dist;
	// calculate distance to center
	always @(posedge clk or negedge rst)begin
		if(!rst)begin
			dist <= 18'b0;
		end
		else begin
			dist <= ux*ux + uy*uy;
		end
	end

	// seven level of shading
	always @(*)begin
		if(dist<=18'd640)begin
			color[11:8] = (pri_color[11:8]>4'd10) ? pri_color[11:8]-4'd10 : 4'd0;
			color[7:4] = (pri_color[7:4]>4'd10) ? pri_color[7:4]-4'd10 : 4'd0;
			color[3:0] = (pri_color[3:0]>4'd10) ? pri_color[3:0]-4'd10 : 4'd0;
		end
		else if(dist<=18'd25600)begin
			color[11:8] = (pri_color[11:8]>4'd9) ? pri_color[11:8]-4'd9 : 4'd0;
			color[7:4] = (pri_color[7:4]>4'd9) ? pri_color[7:4]-4'd9 : 4'd0;
			color[3:0] = (pri_color[3:0]>4'd9) ? pri_color[3:0]-4'd9 : 4'd0;
		end
		else if(dist<=18'd57600)begin
			color[11:8] = (pri_color[11:8]>4'd8) ? pri_color[11:8]-4'd8 : 4'd0;
			color[7:4] = (pri_color[7:4]>4'd8) ? pri_color[7:4]-4'd8 : 4'd0;
			color[3:0] = (pri_color[3:0]>4'd8) ? pri_color[3:0]-4'd8 : 4'd0;
		end
		else if(dist<=18'd102400)begin
			color[11:8] = (pri_color[11:8]>4'd7) ? pri_color[11:8]-4'd7 : 4'd0;
			color[7:4] = (pri_color[7:4]>4'd7) ? pri_color[7:4]-4'd7 : 4'd0;
			color[3:0] = (pri_color[3:0]>4'd7) ? pri_color[3:0]-4'd7 : 4'd0;
		end
		else if(dist<=18'd160000)begin
			color[11:8] = (pri_color[11:8]>4'd6) ? pri_color[11:8]-4'd6 : 4'd0;
			color[7:4] = (pri_color[7:4]>4'd6) ? pri_color[7:4]-4'd6 : 4'd0;
			color[3:0] = (pri_color[3:0]>4'd6) ? pri_color[3:0]-4'd6 : 4'd0;
		end
		else if(dist<=18'd230400)begin
			color[11:8] = (pri_color[11:8]>4'd5) ? pri_color[11:8]-4'd5 : 4'd0;
			color[7:4] = (pri_color[7:4]>4'd5) ? pri_color[7:4]-4'd5 : 4'd0;
			color[3:0] = (pri_color[3:0]>4'd5) ? pri_color[3:0]-4'd5 : 4'd0;
		end
		else begin
			color[11:8] = (pri_color[11:8]>4'd4) ? pri_color[11:8]-4'd4 : 4'd0;
			color[7:4] = (pri_color[7:4]>4'd4) ? pri_color[7:4]-4'd4 : 4'd0;
			color[3:0] = (pri_color[3:0]>4'd4) ? pri_color[3:0]-4'd4 : 4'd0;
		end
	end

endmodule