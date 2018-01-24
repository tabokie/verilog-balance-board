//  COLOR  //
`define NULL 12'h222

`define GROUND 12'hadc
`define BLANK 12'hadc

`define BOUND 12'h543
`define WALL 12'h543

`define SCORE_COLOR 12'hf76

// draw result
`define NUM_COLOR 12'hfff
`define LOSE_COLOR 12'he16
`define WIN_COLOR 12'hfe3

// draw warning
`define WARNING  12'h4e9

// select
`define CURSOR_COLOR 12'hfff
`define LIMITED_COLOR 12'hf76
`define CONTEST_COLOR 12'h4a5
`define MAP0_COLOR 12'hcd3
`define MAP1_COLOR 12'hf52
`define MAP2_COLOR 12'h29f

//  MODE and CONTROL  //
`define LIMITED 1'b1
`define CONTEST 1'b0
`define LIMITED_TIME 10'd60

//  MAP  //
`define RADIUS_32 12
`define RADIUS_SQUARE_32 144  
// scoring >>
// scoring radius = 
// radius + hole_radius / sqrt2
`define DIFF 10'd25
// score hole >>
`define SCORE_RADIUS_SQUARE_32 225

//  Beeping  //
// interval:
// 8-7-5
`define BEEP_LIMIT 10'd20
`define BEEP_ONE 10'd12
`define BEEP_TWO 10'd5

