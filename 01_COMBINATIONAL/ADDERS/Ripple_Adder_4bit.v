`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2026 12:41:28
// Design Name: 
// Module Name: Ripple_Adder_4bit
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


module Ripple_Adder_4bit(A,B,Cin,S,Cout);
input[3:0] A,B;
wire[2:0] t;
input Cin;
output[3:0] S;
output Cout;
full_adder F1(A[0],B[0],Cin,S[0],t[0]);
full_adder F2(A[1],B[1],t[0],S[1],t[1]);
full_adder F3(A[2],B[2],t[1],S[2],t[2]);
full_adder F4(A[3],B[3],t[2],S[3],Cout);
endmodule
