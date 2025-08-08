module Bcd_test(clk, reset, En, BCD1, BCD0);
input clk, reset, En;
output reg[3:0] BCD1, BCD0;

always @(posedge clk)
begin
	if(reset==1'b0)
	begin
		BCD1<=0;
		BCD0<=0;
	end
	else if(reset==1'b1)
	begin
		if(En==1'b1)
			begin
				if(BCD0==4'b1001)
				begin
					BCD0<=0;
					if(BCD1==4'b0110)	BCD1<=0;
					else BCD1<=BCD1+1'b1;
				end
				else BCD0<=BCD0+1'b1;
			end
		else if(En==1'b0)
			begin
				BCD1<=BCD1;
				BCD0<=BCD0;
			end
			
		end	
	end
endmodule

module seg7(bcd, lcd);
input [3:0] bcd;
output reg [6:0] lcd;

always @(bcd)
	case(bcd)
	  4'b0000: lcd <= 7'b1000000;
     4'b0001: lcd <= 7'b1111001;
     4'b0010: lcd <= 7'b0100100;
     4'b0011: lcd <= 7'b0110000;
     4'b0100: lcd <= 7'b0011001;
     4'b0101: lcd <= 7'b0010010;
     4'b0110: lcd <= 7'b0000010;
     4'b0111: lcd <= 7'b1111000;
     4'b1000: lcd <= 7'b0000000;
     4'b1001: lcd <= 7'b0011000;
		default: lcd='bx;

endcase
endmodule

module clk_div(clk, start, rst, max, count, carry);
input clk, start, rst;
input[25:0] Max;
output reg [25:0] count;
output reg carry;
always @(posedge clk or posedge rst)begin
if(rst) begin
count<=0;
carry<=0;
end
else
if(start) begin
if(count<=Max) begin
count<=count+1;
carry<=0;
end
else begin
count<=0;
carry<=1;
end
end
end
endmodule

module BcdCounter (clk, div_clk, rst, en, digit1, digit0);
input clk, rst, en;
output div_clk;

output wire[6:0] digit1, digit0;
wire [3:0] BCD1, BCD0;
reg [25:0] clk_div<=12500000;
reg div2_4;
always @(1) begin

assign div_clk=div2_4;
wire tmp;
clk_div cd(.clk(clk), .start(1), .rst(rst), .Max(clk_div), .carry(tmp));
always @(posedge tmp) begin
div2_4<=div2_4+1;
end
	Bcd_test b1(div_clk, rst, en, BCD1, BCD0);
	seg7 s1(BCD1, digit1);
	seg7 s0(BCD0, digit0);
endmodule
