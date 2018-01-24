`define UPPER_BOUND 11'd100
// velocity <= 100

module solve_velocity(
    input clk,
	input rst,
	input [3:0] collision,
	input [10:0] acceleration_x,
	input [10:0] acceleration_y,
	output reg [10:0] velocity_x,
	output reg [10:0] velocity_y
);

    reg [10:0] x = 11'd0;
    reg [10:0] y = 11'd0;

	always @(posedge clk or negedge rst)begin
		if(!rst)begin
			x <= 11'd0;
		end
		else begin
			case(x[10])
			1'b1:begin
				if(collision[1] && x[9:0]!=10'b0)begin // left and collision
					x <= (~x+11'd1)>>1;
				end
				else if (acceleration_x[10]==1'b0 || x>=~`UPPER_BOUND+11'd1) begin
					x <= x + acceleration_x ;
				end
			end
			1'b0:begin
				if(collision[0] && x[9:0]!=10'b0)begin  // right and collision
					x <= ~(x>>1)+11'd1;
				end
				else if(acceleration_x[10]==1'b1 || x<=`UPPER_BOUND) begin
					x <= x + acceleration_x;
				end
			end
			endcase
		end			

	end

	always @(posedge clk or negedge rst)begin
		if(!rst)begin
			y <= 11'd0;
		end
		else begin			
			case(y[10])
			1'b1:begin
				if(collision[3] && y[9:0]!=10'b0)begin // up and collision
					y <= (~y+11'd1)>>1;
				end
				else if (acceleration_y[10]==1'b0 || y>=~`UPPER_BOUND+11'd1) begin
					y <= y + acceleration_y ;
				end
			end
			1'b0:begin
				if(collision[2] && y[9:0]!=10'b0)begin // down and collision
					y <= ~(y>>1)+11'd1;
				end
				else if(acceleration_y[10]==1'b1 || y<=`UPPER_BOUND) begin
					y <= y + acceleration_y;
				end
			end
			endcase
		end			
	end

	always @(*)begin
		if(x<=`UPPER_BOUND||x>=~`UPPER_BOUND+11'd1)begin
			velocity_x = x;
		end
		else if(x[10]==1'b1)begin
			velocity_x = ~`UPPER_BOUND+11'd1;
		end
		else begin
			velocity_x = `UPPER_BOUND;
		end

		if(y<=`UPPER_BOUND||y>=~`UPPER_BOUND+11'd1)begin
			velocity_y = y;
		end
		else if(y[10]==1'b1)begin
			velocity_y = ~`UPPER_BOUND+11'd1;
		end
		else begin
			velocity_y = `UPPER_BOUND;
		end
	end

endmodule
