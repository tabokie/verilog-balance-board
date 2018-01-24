`include "head.v"

module draw_score(
    input clk,
    input rst,
    input [10:0] x,
    input [10:0] y,
    input mode,
    input [10:0] score_x,
    input [10:0] score_y,
    input [11:0] score_color,
    output [11:0] color
);
    // assert(x,y>0 posx,y>0)

    assign dist_out = dist;
    reg [31:0] dist = 32'hffffffff;


    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            dist <= 32'hffffffff;
        end
        else begin
            dist <= ({{22{x[10]}},x[9:0]} + ~{{22{score_x[10]}},score_x[9:0]} + 32'b1)*({{22{x[10]}},x[9:0]} + ~{{22{score_x[10]}},score_x[9:0]} + 32'b1)+({{22{y[10]}},y[9:0]} + ~{{22{score_y[10]}},score_y[9:0]} + 32'b1)*({{22{y[10]}},y[9:0]} + ~{{22{score_y[10]}},score_y[9:0]} + 32'b1);
        end
    end

    assign in_score = (x[10]==1'b1 || y[10]==1'b1 || dist>`SCORE_RADIUS_SQUARE_32) ? 1'b0 : 1'b1;

    // choose color
    assign color = (~in_score) ? `NULL : (mode==`LIMITED ? score_color : `SCORE_COLOR);

endmodule

