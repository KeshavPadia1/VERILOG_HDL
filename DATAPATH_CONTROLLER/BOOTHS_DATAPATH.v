`timescale 1ns / 1ps

module BOOTHS_DATAPATH(LdA,LdQ,LdM,ClrA,ClrQ,SftA,SftQ,Clrff,Q0,Qm1,LdCnt,Dec,EqZ,SubAdd,Data_in,Clk);

input LdA,LdQ,LdM,ClrA,ClrQ,SftA,SftQ,Clrff,Dec,SubAdd,Clk,LdCnt;
input[15:0] Data_in;
output EqZ,Qm1,Q0;
wire[15:0] A,Q,M,Z;
wire[4:0] Count;

assign EqZ = ~|Count;
assign Q0 = Q[0];

ShiftReg S1(A,Z,Z[15],LdA,ClrA,SftA,Clk);
ShiftReg S2(Q,Data_in,A[0],LdQ,ClrQ,SftQ,Clk);
PIPO P1(M,Data_in,LdM,Clk);
DFF D1(Qm1,Q[0],Clrff,Clk);
COUNTER C1(Count,Dec,LdCnt,Clk);
ALU A1(Z,A,M,SubAdd);

endmodule

module ShiftReg(d_out,d_in,Bit,Ld,Clr,Sft,Clk);

input[15:0] d_in;
input Bit,Ld,Sft,Clk,Clr;
output reg[15:0] d_out;

always @(posedge Clk)
begin
if(Clr) d_out <=0;
else if(Ld) d_out <=d_in;
else if(Sft) d_out <= {Bit,d_in[15:1]};
end

endmodule

module PIPO(d_out,d_in,Ld,Clk);

input[15:0] d_in;
input Ld,Clk;
output reg[15:0] d_out;

always @(posedge Clk)
if(Ld) d_out<=d_in;

endmodule

module DFF(d_out,d_in,Clr,Clk);

input d_in,Clr,Clk;
output reg d_out;

always @(posedge Clk)
begin
if(Clr) d_out<=0;
else d_out<=d_in;
end

endmodule

module COUNTER(Count,Dec,LdCnt,Clk);

input LdCnt,Clk,Dec;
output reg[4:0] Count;

always @(posedge Clk)
begin
if(LdCnt) Count <=5'b10000;
else if(Dec) Count<=Count-1;
end

endmodule

module ALU(d_out,A,B,S);

input[15:0] A,B;
input S;
output reg[15:0] d_out;

always @(*)
begin
if(S==0) d_out = A+B;
else if(S==1) d_out = A-B;
end

endmodule








