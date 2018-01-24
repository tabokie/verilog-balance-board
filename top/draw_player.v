`include "head.v"

module draw_player(
    input clk,
    input rst,
    input [10:0] x,
    input [10:0] y,
    input [10:0] position_x,
    input [10:0] position_y,
    output [11:0] player_color,
    output in_player,
    output near_player
);
    // assert(x,y>0 posx,y>0)

    assign dist_out = dist;
    reg [31:0] dist = 32'hffffffff;


    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            dist <= 32'hffffffff;
        end
        else begin
            dist <= ({{22{x[10]}},x[9:0]} + ~{{22{position_x[10]}},position_x[9:0]} + 32'b1)*({{22{x[10]}},x[9:0]} + ~{{22{position_x[10]}},position_x[9:0]} + 32'b1)+({{22{y[10]}},y[9:0]} + ~{{22{position_y[10]}},position_y[9:0]} + 32'b1)*({{22{y[10]}},y[9:0]} + ~{{22{position_y[10]}},position_y[9:0]} + 32'b1);
        end
    end

    assign in_player = (x[10]==1'b1 || y[10]==1'b1 || dist>`RADIUS_SQUARE_32) ? 1'b0 : 1'b1;
    assign near_player = (x[10]==1'b1 || y[10]==1'b1 || dist>`RADIUS_SQUARE_32+32'd17) ? 1'b0 : 1'b1;

    // 3D effect
    assign player_color = (~in_player) ? `NULL : {3{4'b1111-dist[8:5]}};

endmodule

