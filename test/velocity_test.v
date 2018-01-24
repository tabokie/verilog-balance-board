`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:50:38 01/10/2018
// Design Name:   solve_velocity
// Module Name:   E:/code/verilog/balance_board/velocity_test.v
// Project Name:  balance_board
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: solve_velocity
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module velocity_test;

	// Inputs
	reg clk;
	reg rst;
	reg [3:0] collision;
	reg [10:0] acceleration_x;
	reg [10:0] acceleration_y;

	// Outputs
	wire [10:0] velocity_x;
	wire [10:0] velocity_y;
	wire [3:0] collision_after;
	
	// test
	wire [10:0] x;
	wire [10:0] y;

	// Instantiate the Unit Under Test (UUT)
	solve_velocity uut (
		.clk(clk), 
		.rst(rst), 
		.collision(collision), 
		.acceleration_x(acceleration_x), 
		.acceleration_y(acceleration_y), 
		.velocity_x(velocity_x), 
		.velocity_y(velocity_y)
		// test
		//,
		//.x_show(x),
		//.y_show(y)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		#10;
		rst = 1;
		collision = 4'b0100;
		acceleration_x = 11'd10;
		acceleration_y = 11'd10;

		// Wait 100 ns for global reset to finish
		#100;
       forever begin
			clk = ~clk;
			#5;
		 end
		// Add stimulus here

	end
      
endmodule

