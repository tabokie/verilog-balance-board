`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:25:39 01/10/2018
// Design Name:   solve_sin
// Module Name:   E:/code/verilog/balance_board/sin_test.v
// Project Name:  balance_board
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: solve_sin
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sin_test;

	// Inputs
	reg clk;
	reg rst;
	reg [3:0] slope;

	// Outputs
	wire [10:0] sin_x;
	wire [10:0] sin_y;

	// Instantiate the Unit Under Test (UUT)
	solve_sin uut (
		.clk(clk), 
		.rst(rst), 
		.slope(slope), 
		.sin_x(sin_x), 
		.sin_y(sin_y)
	);

	integer i;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		slope = 0;
		rst = 1;
		// Wait 100 ns for global reset to finish
		#100;
		for(i=0;i<5000;i=i+1)begin
			clk = ~clk;
			#5;
			// test positive move
			if(i==100)begin
				slope = 4'b0101;
			end
			// test negative move
			if(i==120)begin
				slope = 4'b1010;
			end
			// test collision
			if(i==140)begin
				slope = 4'b1101;
			end
			if(i==150)begin
				slope = 4'b0;
			end
			// test overflow
			if(i==160)begin
				slope = 4'b1001;
			end
		end
        
		// Add stimulus here

	end
      
endmodule

