// out of bound mark
`define OUT 11'b10000000000

module transform_mapping(
	input clk,
	input [10:0] sin_x,
	input [10:0] sin_y,
	input [10:0] x,
	input [10:0] y,
	output [10:0] x_out,
	output [10:0] y_out
);

	// dx ~ sinx
	wire [10:0] dx;
	wire [10:0] dy;
	reg [10:0] dx_direct;
	reg [10:0] dy_direct;
	always @(posedge clk)begin
		dx_direct <= {{2{sin_x[10]}},sin_x[9:1]} ;
		dy_direct <= {{2{sin_y[10]}},sin_y[9:1]} ;
	end
	assign dx = (dx_direct>~11'd60+11'd1 || dx_direct<11'd60) ? dx_direct : ((dx_direct[10]==1'b1) ? (~11'd60+11'd1) : 11'd60);
	assign dy = (dy_direct>~11'd60+11'd1 || dy_direct<11'd60) ? dy_direct : ((dy_direct[10]==1'b1) ? (~11'd60+11'd1) : 11'd60);
	
	reg [7:0] kx;
	reg [7:0] ky;
	// kx(t) = x0 / (x0 - t)

	// t = dx*x or dx*(240-x)
	wire [31:0] dxx;
	wire [31:0] dyy;
	assign dxx = (dx[10]==1'b0) ? {{22{x[10]}},x[9:0]}*{{22{dx[10]}},dx[9:0]} : (32'd481+~{{22{x[10]}},x[9:0]})*{21'b0,~dx+11'd1};
	assign dyy = (dy[10]==1'b0) ? {{22{y[10]}},y[9:0]}*{{22{dy[10]}},dy[9:0]} : (32'd481+~{{22{y[10]}},y[9:0]})*{21'b0,~dy+11'd1};

	// solve k through ROM
	always@(dyy)begin
		case(dyy[14:8])
			7'd0:begin
				kx<=8'd128 ;
			end
			7'd1:begin
				kx<=8'd128 ;
			end
			7'd2:begin
				kx<=8'd129 ;
			end
			7'd3:begin
				kx<=8'd129 ;
			end
			7'd4:begin
				kx<=8'd130 ;
			end
			7'd5:begin
				kx<=8'd130 ;
			end
			7'd6:begin
				kx<=8'd131 ;
			end
			7'd7:begin
				kx<=8'd132 ;
			end
			7'd8:begin
				kx<=8'd132 ;
			end
			7'd9:begin
				kx<=8'd133 ;
			end
			7'd10:begin
				kx<=8'd133 ;
			end
			7'd11:begin
				kx<=8'd134 ;
			end
			7'd12:begin
				kx<=8'd135 ;
			end
			7'd13:begin
				kx<=8'd135 ;
			end
			7'd14:begin
				kx<=8'd136 ;
			end
			7'd15:begin
				kx<=8'd137 ;
			end
			7'd16:begin
				kx<=8'd137 ;
			end
			7'd17:begin
				kx<=8'd138 ;
			end
			7'd18:begin
				kx<=8'd139 ;
			end
			7'd19:begin
				kx<=8'd139 ;
			end
			7'd20:begin
				kx<=8'd140 ;
			end
			7'd21:begin
				kx<=8'd141 ;
			end
			7'd22:begin
				kx<=8'd141 ;
			end
			7'd23:begin
				kx<=8'd142 ;
			end
			7'd24:begin
				kx<=8'd143 ;
			end
			7'd25:begin
				kx<=8'd144 ;
			end
			7'd26:begin
				kx<=8'd144 ;
			end
			7'd27:begin
				kx<=8'd145 ;
			end
			7'd28:begin
				kx<=8'd146 ;
			end
			7'd29:begin
				kx<=8'd146 ;
			end
			7'd30:begin
				kx<=8'd147 ;
			end
			7'd31:begin
				kx<=8'd148 ;
			end
			7'd32:begin
				kx<=8'd149 ;
			end
			7'd33:begin
				kx<=8'd150 ;
			end
			7'd34:begin
				kx<=8'd150 ;
			end
			7'd35:begin
				kx<=8'd151 ;
			end
			7'd36:begin
				kx<=8'd152 ;
			end
			7'd37:begin
				kx<=8'd153 ;
			end
			7'd38:begin
				kx<=8'd154 ;
			end
			7'd39:begin
				kx<=8'd154 ;
			end
			7'd40:begin
				kx<=8'd155 ;
			end
			7'd41:begin
				kx<=8'd156 ;
			end
			7'd42:begin
				kx<=8'd157 ;
			end
			7'd43:begin
				kx<=8'd158 ;
			end
			7'd44:begin
				kx<=8'd159 ;
			end
			7'd45:begin
				kx<=8'd160 ;
			end
			7'd46:begin
				kx<=8'd160 ;
			end
			7'd47:begin
				kx<=8'd161 ;
			end
			7'd48:begin
				kx<=8'd162 ;
			end
			7'd49:begin
				kx<=8'd163 ;
			end
			7'd50:begin
				kx<=8'd164 ;
			end
			7'd51:begin
				kx<=8'd165 ;
			end
			7'd52:begin
				kx<=8'd166 ;
			end
			7'd53:begin
				kx<=8'd167 ;
			end
			7'd54:begin
				kx<=8'd168 ;
			end
			7'd55:begin
				kx<=8'd169 ;
			end
			7'd56:begin
				kx<=8'd170 ;
			end
			7'd57:begin
				kx<=8'd171 ;
			end
			7'd58:begin
				kx<=8'd172 ;
			end
			7'd59:begin
				kx<=8'd173 ;
			end
			7'd60:begin
				kx<=8'd174 ;
			end
			7'd61:begin
				kx<=8'd175 ;
			end
			7'd62:begin
				kx<=8'd176 ;
			end
			7'd63:begin
				kx<=8'd177 ;
			end
			7'd64:begin
				kx<=8'd178 ;
			end
			7'd65:begin
				kx<=8'd179 ;
			end
			7'd66:begin
				kx<=8'd181 ;
			end
			7'd67:begin
				kx<=8'd182 ;
			end
			7'd68:begin
				kx<=8'd183 ;
			end
			7'd69:begin
				kx<=8'd184 ;
			end
			7'd70:begin
				kx<=8'd185 ;
			end
			7'd71:begin
				kx<=8'd187 ;
			end
			7'd72:begin
				kx<=8'd188 ;
			end
			7'd73:begin
				kx<=8'd189 ;
			end
			7'd74:begin
				kx<=8'd190 ;
			end
			7'd75:begin
				kx<=8'd192 ;
			end
			7'd76:begin
				kx<=8'd193 ;
			end
			7'd77:begin
				kx<=8'd194 ;
			end
			7'd78:begin
				kx<=8'd195 ;
			end
			7'd79:begin
				kx<=8'd197 ;
			end
			7'd80:begin
				kx<=8'd198 ;
			end
			7'd81:begin
				kx<=8'd200 ;
			end
			7'd82:begin
				kx<=8'd201 ;
			end
			7'd83:begin
				kx<=8'd202 ;
			end
			7'd84:begin
				kx<=8'd204 ;
			end
			7'd85:begin
				kx<=8'd205 ;
			end
			7'd86:begin
				kx<=8'd207 ;
			end
			7'd87:begin
				kx<=8'd208 ;
			end
			7'd88:begin
				kx<=8'd210 ;
			end
			7'd89:begin
				kx<=8'd211 ;
			end
			7'd90:begin
				kx<=8'd213 ;
			end
			7'd91:begin
				kx<=8'd214 ;
			end
			7'd92:begin
				kx<=8'd216 ;
			end
			7'd93:begin
				kx<=8'd218 ;
			end
			7'd94:begin
				kx<=8'd219 ;
			end
			7'd95:begin
				kx<=8'd221 ;
			end
			7'd96:begin
				kx<=8'd223 ;
			end
			7'd97:begin
				kx<=8'd225 ;
			end
			7'd98:begin
				kx<=8'd226 ;
			end
			7'd99:begin
				kx<=8'd228 ;
			end
			7'd100:begin
				kx<=8'd230 ;
			end
			7'd101:begin
				kx<=8'd232 ;
			end
			7'd102:begin
				kx<=8'd234 ;
			end
			7'd103:begin
				kx<=8'd236 ;
			end
			7'd104:begin
				kx<=8'd238 ;
			end
			7'd105:begin
				kx<=8'd240 ;
			end
			7'd106:begin
				kx<=8'd242 ;
			end
			7'd107:begin
				kx<=8'd244 ;
			end
			7'd108:begin
				kx<=8'd246 ;
			end
			7'd109:begin
				kx<=8'd248 ;
			end
			7'd110:begin
				kx<=8'd250 ;
			end
			7'd111:begin
				kx<=8'd252 ;
			end
			7'd112:begin
				kx<=8'd254 ;
			end
			default:begin
				kx <= 10'd255;
			end
		endcase
	end

	always @(dxx)begin
		case(dxx[14:8])
			7'd0:begin
				ky<=8'd128 ;
			end
			7'd1:begin
				ky<=8'd128 ;
			end
			7'd2:begin
				ky<=8'd129 ;
			end
			7'd3:begin
				ky<=8'd129 ;
			end
			7'd4:begin
				ky<=8'd130 ;
			end
			7'd5:begin
				ky<=8'd130 ;
			end
			7'd6:begin
				ky<=8'd131 ;
			end
			7'd7:begin
				ky<=8'd132 ;
			end
			7'd8:begin
				ky<=8'd132 ;
			end
			7'd9:begin
				ky<=8'd133 ;
			end
			7'd10:begin
				ky<=8'd133 ;
			end
			7'd11:begin
				ky<=8'd134 ;
			end
			7'd12:begin
				ky<=8'd135 ;
			end
			7'd13:begin
				ky<=8'd135 ;
			end
			7'd14:begin
				ky<=8'd136 ;
			end
			7'd15:begin
				ky<=8'd137 ;
			end
			7'd16:begin
				ky<=8'd137 ;
			end
			7'd17:begin
				ky<=8'd138 ;
			end
			7'd18:begin
				ky<=8'd139 ;
			end
			7'd19:begin
				ky<=8'd139 ;
			end
			7'd20:begin
				ky<=8'd140 ;
			end
			7'd21:begin
				ky<=8'd141 ;
			end
			7'd22:begin
				ky<=8'd141 ;
			end
			7'd23:begin
				ky<=8'd142 ;
			end
			7'd24:begin
				ky<=8'd143 ;
			end
			7'd25:begin
				ky<=8'd144 ;
			end
			7'd26:begin
				ky<=8'd144 ;
			end
			7'd27:begin
				ky<=8'd145 ;
			end
			7'd28:begin
				ky<=8'd146 ;
			end
			7'd29:begin
				ky<=8'd146 ;
			end
			7'd30:begin
				ky<=8'd147 ;
			end
			7'd31:begin
				ky<=8'd148 ;
			end
			7'd32:begin
				ky<=8'd149 ;
			end
			7'd33:begin
				ky<=8'd150 ;
			end
			7'd34:begin
				ky<=8'd150 ;
			end
			7'd35:begin
				ky<=8'd151 ;
			end
			7'd36:begin
				ky<=8'd152 ;
			end
			7'd37:begin
				ky<=8'd153 ;
			end
			7'd38:begin
				ky<=8'd154 ;
			end
			7'd39:begin
				ky<=8'd154 ;
			end
			7'd40:begin
				ky<=8'd155 ;
			end
			7'd41:begin
				ky<=8'd156 ;
			end
			7'd42:begin
				ky<=8'd157 ;
			end
			7'd43:begin
				ky<=8'd158 ;
			end
			7'd44:begin
				ky<=8'd159 ;
			end
			7'd45:begin
				ky<=8'd160 ;
			end
			7'd46:begin
				ky<=8'd160 ;
			end
			7'd47:begin
				ky<=8'd161 ;
			end
			7'd48:begin
				ky<=8'd162 ;
			end
			7'd49:begin
				ky<=8'd163 ;
			end
			7'd50:begin
				ky<=8'd164 ;
			end
			7'd51:begin
				ky<=8'd165 ;
			end
			7'd52:begin
				ky<=8'd166 ;
			end
			7'd53:begin
				ky<=8'd167 ;
			end
			7'd54:begin
				ky<=8'd168 ;
			end
			7'd55:begin
				ky<=8'd169 ;
			end
			7'd56:begin
				ky<=8'd170 ;
			end
			7'd57:begin
				ky<=8'd171 ;
			end
			7'd58:begin
				ky<=8'd172 ;
			end
			7'd59:begin
				ky<=8'd173 ;
			end
			7'd60:begin
				ky<=8'd174 ;
			end
			7'd61:begin
				ky<=8'd175 ;
			end
			7'd62:begin
				ky<=8'd176 ;
			end
			7'd63:begin
				ky<=8'd177 ;
			end
			7'd64:begin
				ky<=8'd178 ;
			end
			7'd65:begin
				ky<=8'd179 ;
			end
			7'd66:begin
				ky<=8'd181 ;
			end
			7'd67:begin
				ky<=8'd182 ;
			end
			7'd68:begin
				ky<=8'd183 ;
			end
			7'd69:begin
				ky<=8'd184 ;
			end
			7'd70:begin
				ky<=8'd185 ;
			end
			7'd71:begin
				ky<=8'd187 ;
			end
			7'd72:begin
				ky<=8'd188 ;
			end
			7'd73:begin
				ky<=8'd189 ;
			end
			7'd74:begin
				ky<=8'd190 ;
			end
			7'd75:begin
				ky<=8'd192 ;
			end
			7'd76:begin
				ky<=8'd193 ;
			end
			7'd77:begin
				ky<=8'd194 ;
			end
			7'd78:begin
				ky<=8'd195 ;
			end
			7'd79:begin
				ky<=8'd197 ;
			end
			7'd80:begin
				ky<=8'd198 ;
			end
			7'd81:begin
				ky<=8'd200 ;
			end
			7'd82:begin
				ky<=8'd201 ;
			end
			7'd83:begin
				ky<=8'd202 ;
			end
			7'd84:begin
				ky<=8'd204 ;
			end
			7'd85:begin
				ky<=8'd205 ;
			end
			7'd86:begin
				ky<=8'd207 ;
			end
			7'd87:begin
				ky<=8'd208 ;
			end
			7'd88:begin
				ky<=8'd210 ;
			end
			7'd89:begin
				ky<=8'd211 ;
			end
			7'd90:begin
				ky<=8'd213 ;
			end
			7'd91:begin
				ky<=8'd214 ;
			end
			7'd92:begin
				ky<=8'd216 ;
			end
			7'd93:begin
				ky<=8'd218 ;
			end
			7'd94:begin
				ky<=8'd219 ;
			end
			7'd95:begin
				ky<=8'd221 ;
			end
			7'd96:begin
				ky<=8'd223 ;
			end
			7'd97:begin
				ky<=8'd225 ;
			end
			7'd98:begin
				ky<=8'd226 ;
			end
			7'd99:begin
				ky<=8'd228 ;
			end
			7'd100:begin
				ky<=8'd230 ;
			end
			7'd101:begin
				ky<=8'd232 ;
			end
			7'd102:begin
				ky<=8'd234 ;
			end
			7'd103:begin
				ky<=8'd236 ;
			end
			7'd104:begin
				ky<=8'd238 ;
			end
			7'd105:begin
				ky<=8'd240 ;
			end
			7'd106:begin
				ky<=8'd242 ;
			end
			7'd107:begin
				ky<=8'd244 ;
			end
			7'd108:begin
				ky<=8'd246 ;
			end
			7'd109:begin
				ky<=8'd248 ;
			end
			7'd110:begin
				ky<=8'd250 ;
			end
			7'd111:begin
				ky<=8'd252 ;
			end
			7'd112:begin
				ky<=8'd254 ;
			end
			default:begin
				ky <= 8'd255;
			end
		endcase
	end
	
	// y = 240 + (y-240)*ky(x*dx)
	// x = 240 + (x-240)*kx(y*dy)
	wire [31:0] x_real;
	wire [31:0] y_real;
	wire [31:0] x_mid;
	wire [31:0] y_mid;
	assign x_mid = (x + ~(32'd240) + 32'd1)*kx;
	assign y_mid = (y + ~(32'd240) + 32'd1)*ky;
	assign x_real = 32'd240 + {{8{x_mid[31]}},x_mid[30:7]};
	assign y_real = 32'd240 + {{8{y_mid[31]}},y_mid[30:7]};

	assign x_out = (x_real>=32'b0 && x_real < 32'd480) ? {1'b0,x_real[9:0]} : `OUT;
	assign y_out = (y_real>=32'b0 && y_real < 32'd480) ? {1'b0,y_real[9:0]} : `OUT;

endmodule


