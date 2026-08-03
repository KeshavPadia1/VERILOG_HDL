`timescale 1ns / 1ps

module PIPE_EX1(F,A,B,C,D,CLK);

parameter N=10;
input[N-1:0] A,B,C,D;
output[N-1:0] F;
input CLK;
reg[N-1:0] L12_X1,L12_X2,L12_D,L23_D,L23_X3,L34_F;

assign F = L34_F;   

always @(posedge CLK)
begin
L12_X1 <= #4 A+B; 
L12_X2 <= #4 C-D; 
L12_D <= D;
end 

always @(posedge CLK)
begin 
L23_X3 <= #4 L12_X1 + L12_X2;
L23_D <= L12_D;
end 

always @(posedge CLK)
L34_F <= L23_X3 * L23_D;

endmodule
