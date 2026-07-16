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
parameter N = 4;

input[N-1:0] A,B;
wire[N:0] carry;
input Cin;
output[N-1:0] S;
output Cout;
assign carry[0] = Cin;
assign Cout = carry[N];

genvar i;
generate for(i=0;i<N;i=i+1)
begin: fa_loop
wire t1,t2,t3;
xor G1(t1,A[i],B[i]);
xor G2(S[i],t1,carry[i]);
and G3(t2,A[i],B[i]);
and G4(t3,t1,carry[i]);
or G5(carry[i+1],t2,t3);
end
endgenerate
endmodule
