`include "head.v"
module select_color(
	input clk,
	input rst,
	input [9:0] col_addr,
	input [8:0] row_addr,
	input cursor,
	input mode,
	input [1:0] map,
	output reg [11:0] color
);

	wire [10:0] cur_x;
	wire [10:0] cur_y;
	assign cur_x = {1'b0,col_addr} + ~11'd274 +11'd1;
	// 204 / 254
	assign cur_y = (cursor==1'b0) ? {2'b0,row_addr} + ~11'd204+11'd1 : {2'b0,row_addr} + ~11'd254+11'd1;
	reg [11:0] cur_color;

	wire [10:0] map_x;
	wire [10:0] map_y;
	assign map_x = {1'b0,col_addr} + ~11'd334 +11'd1;
	assign map_y = {2'b0,row_addr} + ~11'd254+11'd1;
	reg [11:0] map_color;

	wire [10:0] mode_x;
	wire [10:0] mode_y;
	assign mode_x = {1'b0,col_addr} + ~11'd334 +11'd1;
	assign mode_y = {2'b0,row_addr} + ~11'd204+11'd1;
	reg [11:0] mode_color;

	always @(*)begin
		if(cur_x>11'd30||cur_y>11'd30)begin
			cur_color = `NULL;
		end
		else begin
			if(cur_x<=cur_y*2+11'd2&&cur_x >= cur_y*2-11'd2)begin
				cur_color = `CURSOR_COLOR;
			end
			else if(cur_x<=(11'd31+~cur_y)*2+11'd2 && cur_x >= (11'd31+~cur_y)*2-11'd2)begin
				cur_color = `CURSOR_COLOR;
			end
			else cur_color = `NULL;
		end
	end

	always @(*)begin
		if(mode_x>11'd30||mode_y>11'd30)begin
			mode_color = `NULL;
		end
		else if(mode==`LIMITED) begin
			if(mode_x>=11'd15&&mode_y>=2*(mode_x+~11'd15+11'd1) || mode_x<=11'd15&&mode_y>=2*(11'd16 + ~mode_x))begin
				mode_color = `LIMITED_COLOR;
			end
			else begin
				mode_color = `NULL;
			end
		end
		else begin
			mode_color = `CONTEST_COLOR;
		end
	end

	always @(*)begin
		if(map_x>11'd30||map_y>11'd30)begin
			map_color = `NULL;
		end
		else if(map==2'b0)begin
			map_color = `MAP0_COLOR;
		end
		else if(map==2'b1)begin
			map_color = `MAP1_COLOR;
		end
		else begin
			map_color = `MAP2_COLOR;
		end
	end

	always @(posedge clk or negedge rst)begin
		if(!rst)begin
			color <= `NULL;
		end
		else begin
			if(cur_color!=`NULL)begin
				color <= cur_color;
			end
			else if(mode_color!=`NULL)begin
				color <= mode_color;
			end
			else begin
				color <= map_color;
			end
		end
	end

endmodule