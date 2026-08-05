`timescale 1ns / 1ps


module CMOS_INVERTER(x,f);

input x;
output f;
supply0 gnd;
supply1 vdd;

pmos(f,vdd,x);
nmos(f,gnd,x);

endmodule
