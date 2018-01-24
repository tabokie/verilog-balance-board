`include "head.v"
module draw_map0(
	input clk,
	input [10:0] x,
	input [10:0] y,
	output reg [11:0] color
);

	reg [11:0] color_out_x;
	reg [11:0] color_out_y;

	wire out;
	assign out = (x[10]==1'b1 || y[10]==1'b1) ? 1'b1 : 1'b0;

	// min unit : 16
	// program wall in 16*16 block
	always @(posedge clk)begin
		case(x[8:4])
			5'd0,5'd1,5'd28,5'd29,5'd30:begin
				color_out_x <= `BOUND;
			end
			5'd5:begin
				if((y[8:4]<=5'd21) && (y[8:4]>=5'd0))begin
					color_out_x <= `WALL;
				end
				else begin
					color_out_x <= `GROUND;
				end
			end

			5'd10:begin
				if(y[8:4]<=5'd19 && y[8:4]>=5'd10)begin
					color_out_x <= `WALL;
				end
				else begin
					color_out_x <= `GROUND;
				end
			end

			5'd19:begin
				if(y[8:4]<=5'd13 && y[8:4]>=5'd10)begin
					color_out_x <= `WALL;
				end
				else if(y[8:4]==5'd19 && y[8:4]>=5'd16)begin
					color_out_x <= `WALL;
				end
				else begin
					color_out_x <= `GROUND;
				end
			end

			5'd16:begin
				if(y[8:4]<=5'd27 && y[8:4]>=5'd22)begin
					color_out_x <= `WALL;
				end
				else begin
					color_out_x <= `GROUND;
				end
			end

			5'd24:begin
				if(y[8:4]>=5'd11 && y[8:4]<=5'd22)begin
					color_out_x <= `WALL;
				end
				else begin
					color_out_x <= `GROUND;
				end
			end

			default:begin
				color_out_x <= `GROUND;
			end
		endcase
	end

	always @(posedge clk)begin
		case(y[8:4])
			5'd0,5'd1,5'd28,5'd29,5'd30:begin
				color_out_y <= `BOUND;
			end
			5'd7:begin
				if(x[8:4]<=5'd27 && x[8:4]>=5'd8)begin
					color_out_y <= `WALL;
				end
				else begin
					color_out_y <= `GROUND;
				end
			end

			5'd10:begin
				if(x[8:4]<=5'd18 && x[8:4]>=5'd11)begin
					color_out_y <= `WALL;
				end
				else begin
					color_out_y <= `GROUND;
				end
			end

			5'd19:begin
				if(x[8:4]<=5'd18 && x[8:4]>=5'd11)begin
					color_out_y <= `WALL;
				end
				else begin
					color_out_y <= `GROUND;
				end
			end

			5'd22:begin
				if(x[8:4]<=5'd25 && x[8:4]>=5'd16)begin
					color_out_y <= `WALL;
				end
				else begin
					color_out_y <= `GROUND;
				end
			end

			5'd25:begin
				if(x[8:4]>=5'd22)begin
					color_out_y <= `WALL;
				end
				else begin
					color_out_y <= `GROUND;
				end
			end

			default:begin
				color_out_y <= `GROUND;
			end
		endcase
	end

	always @(*)begin
		if(out==1'b1)begin
			color = `NULL;
		end
		else if(color_out_x==`BOUND || color_out_y==`BOUND)begin
			color = `BOUND;
		end
		else if(color_out_x==`WALL || color_out_y==`WALL)begin
			color = `WALL;
		end
		else begin
			color = `GROUND;
		end
	end	

endmodule