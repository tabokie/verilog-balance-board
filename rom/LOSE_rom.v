`include "head.v"

// Display 'LOSE'
module LOSE_rom(
	input clk,
	input [5:0] x,
	input [2:0] y,
	output reg [11:0] color
);

	reg [7:0] col0 = 8'b0000_0000;  
	reg [7:0] col1 = 8'b0111_1111;  
	reg [7:0] col2 = 8'b0100_0000;  
	reg [7:0] col3 = 8'b0100_0000;  
	reg [7:0] col4 = 8'b0100_0000;  
	reg [7:0] col5 = 8'b0100_0000;  
	reg [7:0] col6 = 8'b0000_0000; 

	reg [7:0] col7 = 8'b0000_0000;  
	reg [7:0] col8 = 8'b0011_1110;  
	reg [7:0] col9 = 8'b0100_0001;  
	reg [7:0] col10 = 8'b0100_0001;  
	reg [7:0] col11 = 8'b0100_0001;  
	reg [7:0] col12 = 8'b0011_1110;  
	reg [7:0] col13 = 8'b0000_0000;

	reg [7:0] col14 = 8'b0000_0000;  
	reg [7:0] col15 = 8'b0010_0110;  
	reg [7:0] col16 = 8'b0100_1001;  
	reg [7:0] col17 = 8'b0100_1001;  
	reg [7:0] col18 = 8'b0100_1001;  
	reg [7:0] col19 = 8'b0011_0010;  
	reg [7:0] col20 = 8'b0000_0000;  

	reg [7:0] col21 = 8'b0000_0000;  
	reg [7:0] col22 = 8'b0111_1111;  
	reg [7:0] col23 = 8'b0100_1001;  
	reg [7:0] col24 = 8'b0100_1001;  
	reg [7:0] col25 = 8'b0100_1001;  
	reg [7:0] col26 = 8'b0100_0001;  
	reg [7:0] col27 = 8'b0000_0000;

	//  LOSE  //
	always @(posedge clk)begin 
	case(x)
	6'd0:begin
	    if(col0[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd1:begin
	    if(col1[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd2:begin
	    if(col2[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd3:begin
	    if(col3[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd4:begin
	    if(col4[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd5:begin
	    if(col5[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd6:begin
	    if(col6[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd7:begin
	    if(col7[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd8:begin
	    if(col8[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd9:begin
	    if(col9[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd10:begin
	    if(col10[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd11:begin
	    if(col11[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd12:begin
	    if(col12[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd13:begin
	    if(col13[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd14:begin
	    if(col14[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd15:begin
	    if(col15[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd16:begin
	    if(col16[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd17:begin
	    if(col17[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd18:begin
	    if(col18[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd19:begin
	    if(col19[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd20:begin
	    if(col20[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd21:begin
	    if(col21[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd22:begin
	    if(col22[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd23:begin
	    if(col23[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd24:begin
	    if(col24[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd25:begin
	    if(col25[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd26:begin
	    if(col26[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd27:begin
	    if(col27[y]==1'b1)begin
	        color <= `LOSE_COLOR;
	    end
	    else color <= `NULL;
	end
	default:begin
		color <= `WARNING;
	end
	endcase
	
	end

	

endmodule