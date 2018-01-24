`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:22:18 01/10/2018
// Design Name:   timer
// Module Name:   E:/code/verilog/balance_board/timer_test.v
// Project Name:  balance_board
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: timer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module timer_test;

	// Inputs
	reg clk;
	reg rst;
	reg start;
	reg endn;

	// Outputs
	wire [9:0] sec;
	wire [2:0] remainder;
	wire [1:0] digit;
	wire [3:0] a;

	// Instantiate the Unit Under Test (UUT)
	timer uut (
		.clk(clk), 
		.rst(rst),
		.start(start),
		.endn(endn),
		// output
		.sec(sec),
		.remainder(remainder),
		.digit(digit),
		.a0(a[0]),
		.a1(a[1]),
		.a2(a[2]),
		.a3(a[3])
	);
	integer i;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		#5;
		rst = 1;
		start = 1;
		endn = 0;
		// Wait 100 ns for global reset to finish
		#100;
	    forever begin
	    	clk = ~clk;
	    	#5;
	    end
		// Add stimulus here


	end
		always @(*)begin
			if(sec==9'd1001)begin
				endn = 1'b1;
			end
		end      
endmodule

