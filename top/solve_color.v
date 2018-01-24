`define delta 11'd10
`include "head.v"

module solve_color(
	input clk,
	input vga_clk,
	input rst,
	input [9:0] col_addr,
	input [8:0] row_addr,
	// Slope effect
	input [10:0] sin_x,
	input [10:0] sin_y,
	// Player tracing
	input [10:0] position_x,
	input [10:0] position_y,
	// Mode related
	input [1:0] map,
	input mode,
	input [10:0] score_x,
	input [10:0] score_y,
	input [11:0] score_color,
	// Color output
	output [11:0] color,
	// Coliision checking based on pixel scan
	output reg [3:0] collision
);

	wire [10:0] real_x;
	wire [10:0] real_y;
	// transform coords
	transform_mapping transform(.clk(clk),
		.sin_x(sin_x),.sin_y(sin_y),
		.x({1'b0,col_addr}+~11'd80+11'd1),.y({2'b0,row_addr}),
		.x_out(real_x),.y_out(real_y));

	// draw player
	wire [11:0] player_color;
	wire in_player;
	wire near_player;
	draw_player d0(.clk(clk),.rst(rst),
		.x(real_x),.y(real_y ),.position_x(position_x),.position_y(position_y),
		.player_color(player_color),.in_player(in_player),.near_player(near_player));

	// draw score target
	wire [11:0] r_score_color;
	draw_score s0(.clk(clk),.rst(rst),
		.x(real_x),.y(real_y ),.mode(mode),.score_x(score_x),.score_y(score_y),.score_color(score_color),
		.color(r_score_color));

	// draw map
	wire [11:0] map_color;
	draw_map m0(.clk(clk),
		.x(real_x),.y(real_y),.map(map),
		.color(map_color));

	// composite
	assign color = (in_player==1'b1) ? player_color : ((r_score_color==`NULL) ? map_color : r_score_color);

	// process collision
	always @(posedge vga_clk)begin
		if(near_player)begin
			// if accessible
			if(map_color==`BLANK||map_color==12'hfff)begin
				collision = 4'b0;
			end
			else begin
				if(real_x > position_x + `delta)collision[0] = 1'b1;
				if(real_x < position_x +~`delta + 11'b1)collision[1] = 1'b1;
				if(real_y > position_y + `delta)collision[2] = 1'b1;
				if(real_y < position_y + ~`delta + 11'b1)collision[3] = 1'b1;
			end
		end
		else begin
			collision = 4'b0;
		end
	end


endmodule
