`include "head.v"

// Display three digit + 's'
module digit3_rom(
	input clk,
	input [5:0] x,
	input [2:0] y,
	input [3:0] a0,
	input [3:0] a1,
	input [3:0] a2,
	output reg [11:0] color
);
	wire [7:0] col0 ;  
	wire [7:0] col1 ;  
	wire [7:0] col2 ;  
	wire [7:0] col3 ;  
	wire [7:0] col4 ;  
	wire [7:0] col5 ;  
	wire [7:0] col6 ; 
	wire [7:0] col7 ;  
	wire [7:0] col8 ;  
	wire [7:0] col9 ;  
	wire [7:0] col10 ;  
	wire [7:0] col11 ;  
	wire [7:0] col12 ;  
	wire [7:0] col13 ;
	wire [7:0] col14 ;  
	wire [7:0] col15 ;  
	wire [7:0] col16 ;  
	wire [7:0] col17 ;  
	wire [7:0] col18 ;  
	wire [7:0] col19 ;  
	wire [7:0] col20 ;

	number_rom number0(.x(a2),
	.col0(col0),.col1(col1),.col2(col2),.col3(col3),.col4(col4),.col5(col5),.col6(col6));
	number_rom number1(.x(a1),
	.col0(col7),.col1(col8),.col2(col9),.col3(col10),.col4(col11),.col5(col12),.col6(col13));
	number_rom number2(.x(a0),
	.col0(col14),.col1(col15),.col2(col16),.col3(col17),.col4(col18),.col5(col19),.col6(col20));

	reg [7:0] col21 = 8'b0000_0000;  
	reg [7:0] col22 = 8'b0010_0110;  
	reg [7:0] col23 = 8'b0100_1001;  
	reg [7:0] col24 = 8'b0100_1001;  
	reg [7:0] col25 = 8'b0100_1001;  
	reg [7:0] col26 = 8'b0011_0010;  
	reg [7:0] col27 = 8'b0000_0000; 


	always @(posedge clk)begin
	
	case(x)
	6'd0:begin
	    if(col0[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd1:begin
	    if(col1[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd2:begin
	    if(col2[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd3:begin
	    if(col3[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd4:begin
	    if(col4[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd5:begin
	    if(col5[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd6:begin
	    if(col6[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd7:begin
	    if(col7[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd8:begin
	    if(col8[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd9:begin
	    if(col9[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd10:begin
	    if(col10[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd11:begin
	    if(col11[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd12:begin
	    if(col12[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd13:begin
	    if(col13[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd14:begin
	    if(col14[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd15:begin
	    if(col15[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd16:begin
	    if(col16[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd17:begin
	    if(col17[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd18:begin
	    if(col18[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd19:begin
	    if(col19[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd20:begin
	    if(col20[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd21:begin
	    if(col21[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd22:begin
	    if(col22[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd23:begin
	    if(col23[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd24:begin
	    if(col24[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd25:begin
	    if(col25[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd26:begin
	    if(col26[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	6'd27:begin
	    if(col27[y]==1'b1)begin
	        color <= `NUM_COLOR;
	    end
	    else color <= `NULL;
	end
	default:begin
		color <= `WARNING;
	end
	endcase
	
	end

	

endmodule