module delay_module(
	input clk,
	input [BITS-1:0] in,
	output reg [BITS-1:0] out
);

	parameter BITS = 8;

	reg [BITS-1:0] in_last = {BITS{1'b0}};

	generate
		genvar i;
		for(i=0;i<=BITS-1;i=i+1)begin:BIT_i
			// In current clk
			// Any posedge in IN is recorded
			always @(posedge in[i] or negedge clk)begin
				if(in[i]==1'b1)begin
					in_last[i] <= 1'b1;
				end
				else begin
					// Clear at negedge clk
					in_last[i] <= 1'b0;
				end
			end
		end		
	endgenerate

	// And send out at negedge clk
	// For other modules to read in next posedge clk
	always @(negedge clk)begin
		out <= in_last;
	end

endmodule