`include "head.v"
module result_color(
	input clk,
	input rst,
	input [9:0] col_addr,
	input [8:0] row_addr,
	input mode,
	input win,
	input [1:0] digit,
	input [3:0] a0,
	input [3:0] a1,
	input [3:0] a2,
	input [3:0] a3,
	output reg [11:0] color
);
	reg [8:0] y;
	reg [9:0] x;
	// y in [224,256]
	// x:
	// 2 char = [291,347]
	// 3 char = [277,361]
	// 4 char = [263,375]
	// 5 char = [249,389]
	reg NULL = 1'b1;
	reg [11:0] rom_color;
	wire [11:0] win_color;
	wire [11:0] lose_color;
	wire [11:0] digit1_color;
	wire [11:0] digit2_color;
	wire [11:0] digit3_color;
	wire [11:0] digit4_color;
 	always @(*)begin
		y = row_addr+~9'd224+9'd1;
		if(row_addr<9'd224||row_addr>9'd254)begin
			NULL = 1'b1;
		end
		else if(mode==`CONTEST)begin
			case(digit)
			2'b0:begin
				if(col_addr<10'd291||col_addr>10'd345)begin
					NULL = 1'b1;
				end
				else begin
					NULL = 1'b0;
					x = col_addr+~10'd291+10'd1;
					rom_color = digit1_color;
				end
			end
			2'b1:begin
				if(col_addr<10'd277||col_addr>10'd359)begin
					NULL = 1'b1;
				end
				else begin
					NULL = 1'b0;
					x = col_addr+~10'd277+10'd1;
					rom_color = digit2_color;
				end
			end
			2'd2:begin
				if(col_addr<10'd263||col_addr>10'd373)begin
					NULL = 1'b1;
				end
				else begin
					NULL = 1'b0;
					x = col_addr+~10'd263+10'd1;
					rom_color = digit3_color;
				end
			end
			2'd3:begin
				if(col_addr<10'd249||col_addr>10'd387)begin
					NULL = 1'b1;
				end
				else begin
					NULL = 1'b0;
					x = col_addr+~10'd249+10'd1;
					rom_color = digit4_color;
				end
			end
			endcase
		end
		else begin
			case(win)
			1'b0:begin
				if(col_addr<10'd263||col_addr>10'd373)begin
					NULL = 1'b1;
				end
				else begin
					NULL = 1'b0;
					x = col_addr+~10'd263+10'd1;
					rom_color = lose_color;
				end
			end
			1'b1:begin
				if(col_addr<10'd277||col_addr>10'd359)begin
					NULL = 1'b1;
				end
				else begin
					NULL = 1'b0;
					x = col_addr+~10'd277+10'd1;
					rom_color = win_color;
				end
			end
			endcase
		end
	end

	always @(posedge clk or negedge rst)begin
		if(!rst)begin
			color <= `NULL;
		end
		else begin
			if(NULL==1'b1)begin
				color <= `NULL;
			end
			else begin
				color <= rom_color;
			end
		end
	end

	WIN_rom win_rom(.clk(clk),.x(x[7:2]),.y(y[4:2]),.color(win_color));
	LOSE_rom lose_rom(.clk(clk),.x(x[7:2]),.y(y[4:2]),.color(lose_color));
	digit1_rom digit1(.clk(clk),.x(x[7:2]),.y(y[4:2]),.a0(a0),.color(digit1_color));
	digit2_rom digit2(.clk(clk),.x(x[7:2]),.y(y[4:2]),.a0(a0),.a1(a1),.color(digit2_color));
	digit3_rom digit3(.clk(clk),.x(x[7:2]),.y(y[4:2]),.a0(a0),.a1(a1),.a2(a2),.color(digit3_color));
	digit4_rom digit4(.clk(clk),.x(x[7:2]),.y(y[4:2]),.a0(a0),.a1(a1),.a2(a2),.a3(a3),.color(digit4_color));

endmodule







	

