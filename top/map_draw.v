`include "head.v"

module draw_map(
	input clk,
	input [10:0] x,
	input [10:0] y,
	input [1:0] map,
	output reg [11:0] color
);
	wire [11:0] map0_color;
	wire [11:0] map1_color;
	// wire [11:0] map2_color;
	// wire [11:0] map3_color;

	// start with two maps: one programmed, one imported
	always @(*)begin
		case(map)
		2'b0,2'b10:begin
			color = map0_color;
		end
		2'b01,2'b11:begin
			color = map1_color;
		end
		endcase
	end

	draw_map0 map0(.clk(clk),.x(x),.y(y),.color(map0_color));
	draw_map1 map1(.clk(clk),.x(x),.y(y),.color(map1_color));
	// module draw_map2(.clk(clk),.x(x),.y(y),.color(map2_color));
	// module draw_map3(.clk(clk),.x(x),.y(y),.color(map3_color));

endmodule

