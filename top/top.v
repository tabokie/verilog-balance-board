module Top(
	input clk,
	input rst,
	input [7:0] SW,
	// input [4:0] BUTTON,
	inout [4:0]BTN_X,
	inout [3:0]BTN_Y,
	output hs,
	output vs,
	output [3:0] r,
	output [3:0] g,
	output [3:0] b,
	output buzzer
	// Runtime Test Signal
	// ,output [7:0] test_led

	// Simulation Test Signal
	// ,output [10:0] sin_x_s,
	// output [10:0] sin_y_s,
	// output [10:0] velocity_x_s,
	// output [10:0] velocity_y_s,
	// output [10:0] position_x_s,
	// output [10:0] position_y_s
);
	
	// assign sin_x_s = sin_x;
	// assign sin_y_s = sin_y;
	// assign velocity_x_s = velocity_x;
	// assign velocity_y_s = velocity_y;
	// assign position_x_s = position_x;
	// assign position_y_s = position_y;


	//  Clock Divider  //
	reg [31:0] clkdiv = 32'd0;
	always @(posedge clk or negedge rst)begin
		if(!rst)begin
			clkdiv <= 32'd0;
		end
		else begin
			clkdiv <= clkdiv + 32'd1;
		end
	end

	//  Pre-process for Input  //
	wire rst_OK;
	assign rst_OK = rst;

    wire [7:0] SW_OK;
    AntiJitter #(4) anti1[7:0](.clk(clkdiv[15]), .I(SW), .O(SW_OK)) ;

    reg [4:0] BUTTON_OK;
    wire [4:0] keyCode;
	wire keyReady;
	Keypad k0 (.clk(clkdiv[15]), .keyX(BTN_Y), .keyY(BTN_X), .keyCode(keyCode), .ready(keyReady));
	reg wasReady;
    always @(posedge clkdiv[14] or negedge rst_OK)begin
    	if (!rst_OK) begin
    		BUTTON_OK <= 5'b0;
		end else begin
			wasReady <= keyReady;
			// if active
			if (keyReady) begin
				case (keyCode)
					{3'h2,2'h1}:BUTTON_OK[4:1]<=4'b1000;
					{3'h4,2'h1}:BUTTON_OK[4:1]<=4'b0100;
					{3'h3,2'h0}:BUTTON_OK[4:1]<=4'b0010;
					{3'h3,2'h2}:BUTTON_OK[4:1]<=4'b0001;
					default:BUTTON_OK[4:1]<=4'b0;
				endcase
			end
			// if not active, reset to NULL
			else if(wasReady) begin
				BUTTON_OK[4:1] <= 4'b0;
			end
		end
    end

    //  Global Reset  //
    wire global_rst;
    // rst sig from top control
    wire game_rst;
    assign global_rst = rst_OK&&game_rst;


    ///////////////////////
    //  Motion Control  //
    /////////////////////
	wire [3:0] slope;
	// front-back-left-right
	assign slope = (BUTTON_OK[4:1]);

	wire [10:0] sin_x;
	wire [10:0] sin_y;
	solve_sin s0(.clk(clkdiv[18]),.rst(global_rst),
		.slope(slope),
		.sin_x(sin_x),.sin_y(sin_y));

	wire [10:0] acceleration_x;
	wire [10:0] acceleration_y;
	solve_acceleration a0(.clk(clkdiv[18]),.rst(global_rst),
		.sin_x(sin_x),.sin_y(sin_y),
		.acceleration_x(acceleration_x),.acceleration_y(acceleration_y));

	wire [10:0] velocity_x;
	wire [10:0] velocity_y;
	//  interact with collision from Color Display  //
	wire [3:0] collision;
	wire [3:0] stable_collision;
	solve_velocity v0(.clk(clkdiv[18]),.rst(global_rst),
		.acceleration_x(acceleration_x),.acceleration_y(acceleration_y),.collision(stable_collision),
		.velocity_x(velocity_x),.velocity_y(velocity_y));

	wire [10:0] init_x;
	wire [10:0] init_y;
	wire [10:0] position_x;
	wire [10:0] position_y;
	// scoring checking
	wire [10:0] score_x;
	wire [10:0] score_y;
	//  send out WIN signal to Game Control  //
	wire timed_win;
	wire win;
	solve_position p0(.clk(clkdiv[18]),.rst(global_rst),
		.init_x(init_x),.init_y(init_y),
		.score_x(score_x),.score_y(score_y),
		.velocity_x(velocity_x),.velocity_y(velocity_y),.collision(stable_collision),
		.position_x(position_x),.position_y(position_y),.win(win));


	/////////////////////
	//  Game Control  //
	///////////////////

	//  switch selection  //
	wire cursor;
	wire mode;
	wire [1:0] map;
	// state indicater
	wire selecting;
	switch_control control(.clk(clkdiv[18]),.rst(rst_OK),.switch(SW_OK[7:5]),
		.cursor(cursor),.mode(mode),.map(map),.selecting(selecting));

	//  timer module  //
	wire timer_start;
	wire timer_endn;
	wire [9:0] elapsed_sec;
	wire [2:0] sec_remainder;
	wire [1:0] elapsed_digit;
	wire [3:0] elapsed_0;
	wire [3:0] elapsed_1;
	wire [3:0] elapsed_2;
	wire [3:0] elapsed_3;
	timer timer0(.clk(clk),.rst(rst),.start(timer_start),.endn(timer_endn),
		.sec(elapsed_sec),.remainder(sec_remainder),
		.digit(elapsed_digit),.a0(elapsed_0),.a1(elapsed_1),.a2(elapsed_2),.a3(elapsed_3));

	//  Count down  //
	//  beeping and coloring
	wire [11:0] score_color;
	wire countdown_en;
	count_down count(.clk(clk),.rst(global_rst),.enable(countdown_en),.mode(mode),.win(timed_win),
		.sec(elapsed_sec),.remainder(sec_remainder),
		.beep(buzzer),.score_color(score_color));

	//  Top Control  //
	wire [1:0] mask_enable;
	top_control control_top(.clk(clk),.rst(rst_OK),
		.selecting(selecting),.mode(mode),.sec(elapsed_sec),.win(win),
		.timed_win(timed_win),
		.timer_start(timer_start),.timer_endn(timer_endn),.countdown_en(countdown_en),
		.mask_enable(mask_enable),.game_rst(game_rst));

	// fetching map info
	map_info map_info(.clk(clk),.rst(rst),.map(map),
		.score_x(score_x),.score_y(score_y),.init_x(init_x),.init_y(init_y));


	//////////////////////
	//  Color Display  //
	////////////////////
	
	// color composite //
	wire [11:0] pri_color;
	wire [11:0] dim_color;
	wire [11:0] select_color;
	wire [11:0] result_color;
	wire [11:0] final_color;
	// vga driver //
	wire [9:0] col_addr;
	wire [8:0] row_addr;
	vga vga0(.vga_clk(clkdiv[1]),.rst(rst_OK),
		.din(final_color),
		.col_addr(col_addr),.row_addr(row_addr),
		.hs(hs),.vs(vs),.r(r),.g(g),.b(b));
	
	// original color
	solve_color c0(.clk(clk),.vga_clk(clkdiv[1]),.rst(rst_OK),
		.col_addr(col_addr),.row_addr(row_addr),
		.sin_x(sin_x),.sin_y(sin_y),.position_x(position_x),.position_y(position_y),
		.map(map),.mode(mode),.score_x(score_x),.score_y(score_y),.score_color(score_color),
		.color(pri_color),.collision(collision));

	// draw mask when SELECT or END	
	draw_mask mask(.enable(mask_enable),
		.pri_color(pri_color),
		.dim_color(dim_color),.select_color(select_color),.result_color(result_color),
		.color(final_color));
	// mask = Dim_background + Info_display
	dim_color dim(.clk(clk),.rst(rst_OK),.col_addr(col_addr),.row_addr(row_addr),
		.pri_color(pri_color),
		.color(dim_color));
	// info display for SELECT
	select_color select(.clk(clk),.rst(rst_OK),.col_addr(col_addr),.row_addr(row_addr),
		.cursor(cursor),
		.mode(mode),.map(map),
		.color(select_color));
	// info display for END
	result_color result(.clk(clk),.rst(rst_OK),.col_addr(col_addr),.row_addr(row_addr),
		.mode(mode),
		.win(win),
		.digit(elapsed_digit),.a0(elapsed_0),.a1(elapsed_1),.a2(elapsed_2),.a3(elapsed_3),
		.color(result_color));

	// side routine : Collision Receiver  //
	delay_module #(.BITS(4)) t0(.clk(clkdiv[18]),.in(collision),.out(stable_collision));

	// runtime test
	// assign test_led = {stable_collision,buzzer,3'b0};
endmodule

