`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:09:09 01/10/2018
// Design Name:   transform_mapping
// Module Name:   E:/code/verilog/balance_board/transform_test.v
// Project Name:  balance_board
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: transform_mapping
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module transform_test;

	// Inputs
	reg clk;
	reg [10:0] sin_x;
	reg [10:0] sin_y;
	reg [10:0] x;
	reg [10:0] y;

	// Outputs
	wire [10:0] x_out;
	wire [10:0] y_out;

	// Instantiate the Unit Under Test (UUT)
	transform_mapping uut (
		.clk(clk), 
		.sin_x(sin_x), 
		.sin_y(sin_y), 
		.x(x), 
		.y(y), 
		.x_out(x_out), 
		.y_out(y_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		sin_x = -11'd2;
		sin_y = -11'd2;
		x = 11'd200;
		y = 11'd200;

		// Wait 100 ns for global reset to finish
		#100;
      forever begin
			clk = ~clk;
			#5;
		end
		// Add stimulus here

	end
      
endmodule

