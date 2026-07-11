`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2026 14:22:29
// Design Name: 
// Module Name: ripple_adder_4bit_tb
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


module ripple_adder_4bit_tb;
reg[3:0] A,B;
reg Cin;
wire[3:0] S;
wire Cout;
Ripple_Adder_4bit R(A,B,Cin,S,Cout);
initial
begin
$monitor($time,"A=%b,B=%b,Cin=%b,S=%b,Cout=%b",A,B,Cin,S,Cout);
#5 A=4'b1010;B=4'b1001;Cin=0;
#5 A=4'b0101;B=4'b1000;Cin=0;
#5 $finish;
end
endmodule
