`include "head.v"
module switch_control(
	input clk,
	input rst,
	input [2:0] switch,
	output reg cursor,
	output reg mode,
	output reg [1:0] map,
	// output indicater for selecting mode
	output reg selecting
);
	
	always @(posedge clk or negedge rst)begin
		if(!rst)begin
			selecting <= 1'b1;
		end
		else begin
			if(switch[2]==1'b0)begin
				selecting <= 1'b0;
			end
			else begin
				selecting <= 1'b1;
			end
		end
	end

	// change cursor when push second SW
	always @(posedge switch[1] or negedge rst)begin
		if(!rst)begin
			cursor <= 1'b0;
		end
		else if(selecting) begin
			cursor <= ~cursor;
		end
	end

	// change content when push third SW
	always @(posedge switch[0] or negedge rst)begin
		if(!rst)begin
			mode <= 1'b0;
			map <= 2'b0;
		end
		else if(selecting==1'b1) begin
			case(cursor)
			// mode
			2'd0:mode <= ~mode;
			// map
			2'd1:map <= (map==2'd2) ? 2'd0 : map + 2'b1;	
			endcase
		end
	end

endmodule

