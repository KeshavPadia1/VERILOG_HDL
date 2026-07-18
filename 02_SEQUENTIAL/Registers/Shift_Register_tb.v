`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 12:06:19
// Design Name: 
// Module Name: Shift_Register_tb
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


module Shift_Register_tb;
reg A,CLK,CLR;
wire B,C,D,E;
Shift_Register S(A,B,C,D,E,CLK,CLR);
initial
begin
A=1;
CLK=0;
forever #5 CLK=~CLK;
end
initial
begin
$monitor($time,"B=%b,C=%b,D=%b,E=%b,CLK=%b,CLR=%b",B,C,D,E,CLK,CLR);
#5 CLR=1;
#10 A=0;
#50 CLR=0;
#200 $finish;
end
endmodule
