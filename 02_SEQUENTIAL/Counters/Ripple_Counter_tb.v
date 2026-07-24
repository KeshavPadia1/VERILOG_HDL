`timescale 1ns / 1ps

module Ripple_Counter_tb;
reg clk, clr;
wire[6:1] q;
Ripple_Counter R(clk,clr,q);
initial
begin
clk=0;
forever #5 clk = ~clk;
end
initial
begin
$monitor($time,"COUNT=%b, CLK=%b, CLR=%b",q,clk,clr);
#5 clr=1;
#10 clr=0;
#100 $finish;
end
endmodule
