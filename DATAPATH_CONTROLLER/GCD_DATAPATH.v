`timescale 1ns / 1ps

module GCD_DATAPATH(LdA,LdB,Sel1,Sel2,Sel_in,LT,GT,EQ,Data_in,Clk,);

input LdA,LdB,Sel1,Sel2,Sel_in,Clk;
input[15:0] Data_in;
output LT,GT,EQ;
wire[15:0] Bus,SubOut,X,Y,Aout,Bout;

PIPO P1(Aout,LdA,Bus,Clk);
PIPO P2(Bout,LdB,Bus,Clk);
MUX M1(X,Sel1,Aout,Bout);
MUX M2(Y,Sel2,Aout,Bout);
CMP C1(LT,GT,EQ,Aout,Bout);
SUB S1(SubOut,X,Y);
MUX M3(Bus,Sel_in,SubOut,Data_in);

endmodule

module PIPO(Out,Ld,Bus,Clk);

input Ld,Clk;
input[15:0] Bus;
output reg[15:0] Out; 

always @(posedge Clk)
if(Ld) Out<=Bus;

endmodule

module MUX(Out,Sel,A,B);

input Sel;
input[15:0] A,B;
output reg[15:0] Out;

always @(*)
Out = Sel?A:B;

endmodule

module SUB(Out,X,Y);

input[15:0] X,Y;
output reg[15:0] Out;

always @(*)
Out = X-Y;

endmodule

module CMP(LT,GT,EQ,A,B);

input[15:0] A,B;
output reg LT,GT,EQ;

always @(*)
begin
if(A>B) GT=1;
else if(A<B) LT=1;
else EQ=1;
end

endmodule