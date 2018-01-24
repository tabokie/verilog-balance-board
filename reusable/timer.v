module timer(
	input clk,
	input rst,
	input start,
	input endn,
	// second
	output reg [9:0] sec,
	// 1/8 remainder
	output reg [2:0] remainder,
	// decimal digit number
	output reg [1:0] digit,
	// decimal single digit
	output reg [3:0] a0,
	output reg [3:0] a1,
	output reg [3:0] a2,
	output reg [3:0] a3
);

	// 100 MHz clk (10^8 Hz)
	reg [26:0] i;
	always @(posedge clk or negedge rst)begin
		if(!rst||!start)begin
			i <= 27'b1;
			sec <= 10'b0;
			a0 <= 4'b0;
			a1 <= 4'b0;
			a2 <= 4'b0;
			a3 <= 4'b0;
		end
		else if(!endn) begin
			if(i == 27'd100000000)begin
				i <= 27'b1;
				
				// Seconds
				sec <= sec + 10'b1;

				// Decimal form : (a3,a2,a1,a0)
				a0 <= (a0==4'd9) ? 4'd0 : a0 + 4'd1;
				if(a0==4'd9)begin
					a1 <= (a1==4'd9) ? 4'd0 : a1 + 4'd1;
				end 
				if(a0==4'd9 && a1==4'd9)begin
					a2 <= (a2==4'd9) ? 4'd0 : a2 + 4'd1;
				end
				if(a0==4'd9 && a1==4'd9 && a2==4'd9)begin
					a3 <= (a3==4'd9) ? 4'd0 : a3 + 4'd1;
				end
			end
			else begin
				i <= i + 27'b1;
			end
		end
	end

	// Remaider = t / (1/8 sec)
	always @(*)begin
		if(i>27'd87500000)begin
			remainder = 3'd7;
		end
		else if(i>27'd75000000)begin
			remainder = 3'd6;
		end
		else if(i>27'd62500000)begin
			remainder = 3'd5;
		end
		else if(i>27'd50000000)begin
			remainder = 3'd4;
		end
		else if(i>27'd37500000)begin
			remainder = 3'd3;
		end
		else if(i>27'd25000000)begin
			remainder = 3'd2;
		end
		else if(i>27'd12500000)begin
			remainder = 3'd1;
		end
		else begin
			remainder = 3'd0;
		end
	end

	// Digit = decimal number digit
	always @(*)begin
		if(a3!=4'd0)begin
			digit = 2'd3;
		end
		else if(a2!=4'd0)begin
			digit = 2'd2;
		end
		else if(a1!=4'd0)begin
			digit = 2'd1;
		end
		else begin
			digit = 2'd0;
		end
	end


endmodule
