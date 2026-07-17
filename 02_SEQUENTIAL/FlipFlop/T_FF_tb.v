`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2026 12:40:59
// Design Name: 
// Module Name: T_FF_tb
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


module T_FF_tb;
reg clk,clr;
wire q;
T_FF Z(q,clk,clr);
initial
begin
clk = 0;
forever #5 clk = ~clk;
end
initial
begin
$monitor($time," CLK = %B, CLR=%B, Q=%B",clk,clr,q);
#10 clr=0;
#5 clr=1;
#5 clr =0;
#100 $finish;
end
endmodule
