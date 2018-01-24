`include "head.v"

module count_down(
	input clk,
	input rst,
	input mode,
	input win,
	input enable,
	input [9:0] sec,
	input [2:0] remainder,
	output reg beep,// active low
	// change color to RED when counting down
	output [11:0] score_color
);

	// time left
	wire [9:0] down;
	assign down = `LIMITED_TIME + ~sec + 10'd1;
	// beep enable
	reg beep_en = 1'b0;
	// beeping interval indicater
	reg [1:0] interval = 2'b0;

	always @(posedge clk or negedge rst)begin
		if(!rst)begin
			beep_en <= 1'b0;
		end
		else if(!win && mode==`LIMITED)begin
			if(down < `BEEP_LIMIT)begin
				beep_en <= 1'b1;
			end
			else begin
				beep_en <= 1'b0;
			end
			
			// three different beeping speed
			if(down < `BEEP_TWO)begin
				interval <= 2'd2;
			end
			else if(down < `BEEP_ONE)begin
				interval <= 2'd1;
			end
			else begin
				interval <= 2'd0;
			end
		end
		else begin
			beep_en <= 1'b0;
		end
	end


	always @(*)begin
		if(enable && beep_en==1'b1)begin
			case(interval)
			2'd0:begin
				// 7
				if(remainder==3'd7)begin
					beep <= 1'b0;
				end
				else beep <= 1'b1;
			end
			2'd1:begin
				// 3,7
				if(remainder[1:0]==2'b11)begin
					beep <= 1'b0;
				end
				else begin
					beep <= 1'b1;
				end
			end
			2'd2:begin
				// 1,3,5,7
				if(remainder[0]==1'b1)begin
					beep <= 1'b0;
				end
				else begin
					beep <= 1'b1;
				end
			end
			endcase
		end
		else begin
			beep <= 1'b1;
		end
	end

	// from #0F6 to #F06
	assign score_color[11:8] = (down < 16) ? 4'hf-down[3:0] :4'h0;
	assign score_color[7:4] = (down < 16) ? down[3:0] :4'hF;
	assign score_color[3:0] = 4'h6;

endmodule