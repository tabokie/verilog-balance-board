`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:37:29 01/09/2018
// Design Name:   Top
// Module Name:   E:/code/verilog/balance_board/top_test.v
// Project Name:  balance_board
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_test;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] SW;
	reg [4:0] BUTTON;

	// Outputs
	wire hs;
	wire vs;
	wire [3:0] r;
	wire [3:0] g;
	wire [3:0] b;
	wire [7:0] test_led;
	wire [10:0] sin_x;
	wire [10:0] sin_y;
	wire [10:0] velocity_x;
	wire [10:0] velocity_y;
	wire [10:0] position_x;
	wire [10:0] position_y;

	// Instantiate the Unit Under Test (UUT)
	Top uut (
		.clk(clk), 
		.rst(rst), 
		.SW(SW), 
		.BUTTON(BUTTON), 
		.hs(hs), 
		.vs(vs), 
		.r(r), 
		.g(g), 
		.b(b), 
		.test_led(test_led)
		//.sin_x_s(sin_x), 
		//.sin_y_s(sin_y), 
		//.velocity_x_s(velocity_x), 
		//.velocity_y_s(velocity_y), 
		//.position_x_s(position_x), 
		//.position_y_s(position_y)

	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		SW = 0;
		BUTTON = 5'b01010;
		rst = 0;
		#10;
		rst = 1;
		// Wait 100 ns for global reset to finish
		#100;
		forever begin
			clk = ~clk;
			#5;
		end
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

