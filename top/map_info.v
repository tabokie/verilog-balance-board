module map_info(
	input clk,
	input rst,
	input [1:0] map,
	output reg [10:0] score_x,
	output reg [10:0] score_y,
	output reg [10:0] init_x,
	output reg [10:0] init_y
);

	always @(*)begin
		case(map[0])
		1'b0:begin
			score_x = 11'd240;
			score_y = 11'd240;
			init_x = 11'd60;
			init_y = 11'd60;
		end
		1'b1:begin
			score_x = 11'd240;
			score_y = 11'd450;
			init_x = 11'd50;
			init_y = 11'd38;
		end
		endcase
		
	end
	
endmodule