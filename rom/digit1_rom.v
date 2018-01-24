`include "head.v"

// Display one digit + 's'

module digit1_rom(
	input clk,
	input [5:0] x,
	input [2:0] y,
	input [3:0] a0,
	output reg [11:0] color
);

	wire [7:0] col0 ;  
	wire [7:0] col1 ;  
	wire [7:0] col2 ;  
	wire [7:0] col3 ;  
	wire [7:0] col4 ;  
	wire [7:0] col5 ;  
	wire [7:0] col6 ; 

	number_rom number0(.x(a0),
	.col0(col0),.col1(col1),.col2(col2),.col3(col3),.col4(col4),.col5(col5),.col6(col6));

	reg [7:0] col7 = 8'b0000_0000;  
	reg [7:0] col8 = 8'b0010_0110;  
	reg [7:0] col9 = 8'b0100_1001;  
	reg [7:0] col10 = 8'b0100_1001;  
	reg [7:0] col11 = 8'b0100_1001;  
	reg [7:0] col12 = 8'b0011_0010;  
	reg [7:0] col13 = 8'b0000_0000; 

	always @(posedge clk) begin
	
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
	default:begin
		color <= `WARNING;
	end
	endcase

	end
	
	

endmodule