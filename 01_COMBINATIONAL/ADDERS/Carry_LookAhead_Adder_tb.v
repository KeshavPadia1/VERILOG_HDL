`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2026 00:35:58
// Design Name: 
// Module Name: Carry_LookAhead_Adder_tb
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


module Carry_LookAhead_Adder_tb;
reg[3:0] A,B;
reg Cin;
wire[3:0] S;
wire Cout;
Carry_LookAhead_Adder C(A,B,Cin,S,Cout);
initial
begin
$monitor($time,"A=%b,B=%b,Cin=%b,S=%b,Cout=%b",A,B,Cin,S,Cout);
#5 A=4'b1010;B=4'b0101;Cin=0;
#5 A=4'b1001;B=4'b1100;Cin=0;
#5 $finish;
end
endmodule
