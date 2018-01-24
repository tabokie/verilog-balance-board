`include "head.v"
module draw_mask(
	input [1:0] enable,
	input [11:0] pri_color,
	input [11:0] dim_color,
	input [11:0] select_color,
	input [11:0] result_color,
	output reg [11:0] color 
);

	// composite color
	always @(*)begin
		case(enable)
		// select
		2'b1:begin
			color = (select_color == `NULL) ? dim_color : select_color;
		end
		// game
		2'b0:begin
			color = pri_color;
		end
		// result
		2'b10:begin
			color = (result_color == `NULL) ? dim_color : result_color;
		end
		endcase

	end

endmodule