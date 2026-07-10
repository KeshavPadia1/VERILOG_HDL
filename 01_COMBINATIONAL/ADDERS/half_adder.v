`timescale 1ns / 1ps
module Half_Adder(A,B,SUM,CARRY);
input A,B;
output SUM,CARRY;
assign SUM = A^B;
assign CARRY = A&B;
endmodule
