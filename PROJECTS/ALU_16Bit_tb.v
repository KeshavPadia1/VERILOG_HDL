`timescale 1ns / 1ps

module ALU_16Bit_tb;
reg[15:0] A,B;
reg[1:0] OPR;
wire[15:0] Z;
wire SIGN,PARITY,ZERO,OVERFLOW;
  
ALU_16Bit ALU(A,B,OPR,Z,SIGN,PARITY,ZERO,OVERFLOW);
initial
begin
$monitor($time,"A=%b,B=%b,OPR=%b,Z=%b,SIGN=%b,PARITY=%b,ZERO=%b,OVERFLOW=%b",A,B,OPR,Z,SIGN,PARITY,ZERO,OVERFLOW);
#5 A=16'h28f6;B=16'haa32;OPR=2'b00;
#5 A=16'h1111;B=16'habcd;OPR=2'b10;
#5 $finish;
end
endmodule
