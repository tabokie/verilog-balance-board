module solve_sin(
    input clk,
    input rst,
    input [3:0] slope,
    output [10:0] sin_x,
    output [10:0] sin_y
);
    reg [10:0] y = 11'd0;
    reg [10:0] x = 11'd0;
    
    // everytime button pressed,
    // sin ++

    // Horizontal
    always @(posedge clk or negedge rst)begin
        if(!rst)begin
            x <= 11'd0;
        end
        else begin
            case(slope[1:0])
            2'b01:begin
                x <= (x[10]==1'b0 && x >= {1'b0,10'b1111111111}) ? x : x + 11'b1;
            end
            2'b10:begin
                x <= (x[10]==1'b1 && x[9:0] <= 10'b1) ? x : x + 11'b11111111111;
            end
            endcase
        end
    end

    //  Vertical
    always @(posedge clk or negedge rst)begin
        if(!rst)begin
            y <= 11'd0;
        end
        else begin
            case(slope[3:2])
            2'b01:begin
                y <= (y[10]==1'b0 && y >= {1'b0,10'b1111111111}) ? y : y+11'b1;
            end
            2'b10:begin
                y <= (y[10]==1'b1 && y[9:0] <= 10'b1) ? y : y + 11'b11111111111;
            end     
            endcase
        end
    end

    assign sin_y = y;
    assign sin_x = x;
    
endmodule // 