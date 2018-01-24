`define DELTA 2
`include "head.v"

module solve_position(
    input clk,
    input rst,
    input [10:0] init_x,
    input [10:0] init_y,
    // input for checking scoring
    input [10:0] score_x,
    input [10:0] score_y,
    input [10:0] velocity_x,
    input [10:0] velocity_y,
    // input for immediate react to collision
    input [3:0] collision,
    output [10:0] position_x,
    output [10:0] position_y,
    // output for scoring
    output reg win
);

    reg [15:0] x = 16'd0;
    reg [15:0] y = 16'd0;

    // v to unsigned v
    wire [10:0] u_vx;
    wire [10:0] u_vy;
    assign u_vx = (velocity_x[10]==1'b1)? (~velocity_x+11'd1)>>1 : velocity_x>>1;
    assign u_vy = (velocity_y[10]==1'b1)? (~velocity_y+11'd1)>>1 : velocity_y>>1;

    // position delta
    wire [15:0] deltax;
    wire [15:0] deltay;
    assign deltax = {5'b0,u_vx[10:0]};
    assign deltay = {5'b0,u_vy[10:0]};


    always @(posedge clk or negedge rst)begin
        if(!rst)begin
            win <= 1'b0;
            x <= {init_x[8:0],7'b0};
            y <= {init_y[8:0],7'b0};
        end
        // stay win state
        else if(win||near_score)begin
            win <= 1'b1;
            x <= {score_x[8:0],7'b0};
            y <= {score_y[8:0],7'b0};
        end
        else begin
            win <= 1'b0;
            case(collision[1:0])
            2'b00:
                // bouncing
                x <= x + {{6{velocity_x[10]}},velocity_x[9:0]};
            2'b10:
                x <= x + deltax;
            2'b01:
                x <= x + ~deltax + 16'b1;
            endcase

            case(collision[3:2])
            2'b00:
                // bouncing
                y <= y + {{6{velocity_y[10]}},velocity_y[9:0]};
            2'b10:
                y <= y + deltay;
            2'b01:
                y <= y + ~deltay + 16'b1;
            endcase
        end
        
    end

    // turn local parameter to global position
    wire [10:0] scaled_x;
    wire [10:0] scaled_y;
    assign scaled_x = {2'b0,x[15:7]};
    assign scaled_y = {2'b0,y[15:7]};
    // distance to target
    wire [10:0] diff_x;
    wire [10:0] diff_y;
    assign diff_x = (scaled_x>score_x) ? (scaled_x+~score_x+11'b1) : (score_x+~scaled_x+11'b1);
    assign diff_y = (scaled_y>score_y) ? (scaled_y+~score_y+11'b1) : (score_y+~scaled_y+11'b1);
    // is about to scoring
    wire near_score;
    assign near_score = diff_x[9:0]<=`DIFF && diff_y[9:0] <=`DIFF;

    assign position_x = scaled_x;
    assign position_y = scaled_y;

endmodule
