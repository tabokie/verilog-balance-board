// state
`define SELECT 2'b0
`define START 2'b1
`define END 2'd2
`include "head.v"

module top_control(
	input clk,
	input rst,
	// is selecting
	input selecting,
	// game
	input mode,
	output reg timer_start,
	output reg countdown_en,
	// supervise 
	input [9:0] sec,
	input win,
	output reg timed_win,
	// end
	output reg timer_endn,
	output reg [1:0] mask_enable,
	output reg game_rst
);


	reg [1:0] i;
	always @(posedge clk or negedge rst)begin
		if(!rst)begin
			i <= `START;
		end
		else begin
			case(i)
			`SELECT:begin
				// draw selecting mask
				mask_enable <= 1'b1;
				// hold timer
				timer_start <= 1'b0;
				timer_endn <= 1'b0;
				// rst
				game_rst <= 1'b0;
				timed_win <= 1'b0;
				// hold cnt
				countdown_en <= 1'b0;
				// change when exiting selecting
				if(selecting==1'b0)begin
					i <= `START;
				end
			end
			`START:begin
				// start timing
				timer_start <= 1'b1;
				timer_endn <= 1'b0;
				// disable mask
				mask_enable <= 1'b0;
				// diable rst			
				game_rst <= 1'b1;
				// not win
				timed_win <= 1'b0;
				// enable cnt
				countdown_en <= 1'b1;
				// if enter selecting again
				if(selecting==1'b1)begin
					i <= `SELECT;
				end

				if(win==1'b1|| (mode==`LIMITED&&sec>=`LIMITED_TIME))begin
					i <= `END;
					// if win
					if(win==1'b1)begin
						timed_win <= 1'b1;
					end
					// if not win in limited time
					else begin
						timed_win <= 1'b0;
					end
				end
			end
			`END:begin
				// hold timer result
				timer_endn <= 1'b1;
				timer_start <= 1'b1;
				// draw end mask
				mask_enable <= 2'd2;
				// hold rst
				game_rst <= 1'b1;
				// stop cnt
				countdown_en <= 1'b0;
				// if enter selecting
				if(selecting==1'b1)begin
					i <= `SELECT;
				end
			end
			endcase
		end
	end

endmodule