`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2026 00:09:26
// Design Name: 
// Module Name: Carry_LookAhead_Adder
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


module Carry_LookAhead_Adder(A,B,Cin,S,Cout);
input[3:0] A,B;
input Cin;
output Cout;
output[3:0] S;
wire[3:0] P,G;
wire[3:1] C;
assign P[0] = A[0]^B[0];
assign P[1] = A[1]^B[1]; 
assign P[2] = A[2]^B[2];
assign P[3] = A[3]^B[3];
assign G[0] = A[0]&B[0];
assign G[1] = A[1]&B[1];
assign G[2] = A[2]&B[2];
assign G[3] = A[3]&B[3];
assign C[1] = G[0] | (P[0]&Cin);
assign C[2] = G[1] | (P[1]&C[1]);
assign C[3] = G[2] | (P[2]&C[2]);
assign Cout = G[3] | (P[3]&C[3]);
assign S[0] = A[0]^B[0]^Cin;
assign S[1] = A[1]^B[1]^C[1];
assign S[2] = A[2]^B[2]^C[2];
assign S[3] = A[3]^B[3]^C[3];
endmodule
