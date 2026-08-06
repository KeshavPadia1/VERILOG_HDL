`timescale 1ns / 1ps

module CMOS_NAND(F,X,Y);

input X,Y;
output F;
wire a;
supply1 vdd;
supply0 gnd;

pmos p1(F,vdd,X);
pmos p2(F,vdd,Y);
nmos n1(a,gnd,Y);
nmos n2(F,a,X);

endmodule
