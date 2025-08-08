module Tb_BcdCounter;

reg clk,rst,en;
wire [6:0] digit1, digit0;

BcdCounter BCD(clk,rst, en,digit1,digit0);

always begin
clk=1'b0;
	forever begin
 clk=#5~clk;
end
end

initial
begin
	rst=1'b0; en=1'b0;
#5 rst=1'b0; en=1'b1;

#100 rst=1'b1; en=1'b0;
#100 rst=1'b1; en=1'b1;

end
endmodule