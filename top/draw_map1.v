`include "head.v"
module draw_map1(
	input clk,
	input [10:0] x,
	input [10:0] y,
	output reg [11:0] color
);
	wire [15:0] addr;
	// convert addr
	assign addr = {6'b0,y[10:1]}*16'd240+{6'b0,x[10:1]};
	wire [11:0] rom_color;
	map1_rom map1(.a(addr),.spo(rom_color));

	always @(*)begin
		if(x[10]==1'b1||y[10]==1'b1)begin
			color = `NULL;
		end
		else begin
			color = rom_color;
		end
	end
endmodule