module solve_acceleration(
	input clk,
	input rst,
	input [10:0] sin_x,
  	input [10:0] sin_y,
	output [10:0] acceleration_x,
	output [10:0] acceleration_y
);
	reg [10:0] x = 11'd0;
	reg [10:0] y = 11'd0;


	always @(posedge clk or negedge rst)begin
		if(!rst)begin
			y <= 11'd0;
			x <= 11'd0;
		end
		else begin
		// sin / 64
			x <= {{7{sin_x[10]}},sin_x[3:0]};
			y <= {{7{sin_y[10]}},sin_y[3:0]};
		end
	end
	
	assign acceleration_x = x;
	assign acceleration_y = y;

endmodule
