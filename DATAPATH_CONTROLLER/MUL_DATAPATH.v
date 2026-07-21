`timescale 1ns / 1ps


module MUL_DATAPATH(LdA,LdB,LdP,ClrP,DecB,EqZ,Data_in,Clk);

input LdA,LdB,LdP,ClrP,DecB,Clk;
input[15:0] Data_in;
output EqZ;
wire[15:0] Bus,X,Y,Z,Bout;

assign Bus = Data_in;

PIPO1 reg1(X,Bus,LdA,Clk);
PIPO2 reg2(Y,Z,LdP,Clk,ClrP);
CNTR cntr(Bout,Bus,LdB,DecB,Clk);
ADD add(Z,X,Y);
EQZ CMP(EqZ,Bout);
endmodule


module PIPO1(X,Bus,LdA,Clk);

input Clk,LdA;
input[15:0] Bus;
output reg[15:0] X;

always @(posedge Clk)
begin
if(LdA) X<=Bus;
end
endmodule


module PIPO2(Y,Z,LdP,Clk,Clr);

input Clk,Clr,LdP;
input[15:0] Z;
output reg[15:0] Y;

always @(posedge Clk)
begin
if(Clr) Y<=16'b0000;
else if(LdP) Y<=Z;
end
endmodule


module CNTR(Bout,Bus,LdB,DecB,Clk);

input Clk,DecB,LdB;
input[15:0] Bus;
output reg[15:0] Bout;

always @(posedge Clk)
begin
if(LdB) Bout<=Bus;
else if(DecB) Bout<=Bout-1;
end
endmodule


module ADD(Z,X,Y);

input[15:0] X,Y;
output reg[15:0] Z;

always @(*)
Z = X+Y;

endmodule

module EQZ(EqZ,Bout);

input[15:0] Bout;
output EqZ;

assign EqZ = (Bout==0)?1:0;
endmodule









