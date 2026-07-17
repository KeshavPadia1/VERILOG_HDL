`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2026 14:23:34
// Design Name: 
// Module Name: Ripple_Counter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


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
