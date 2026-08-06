`timescale 1ns / 1ps

module CMOS_MUX(out,sel,i0,i1);

input sel,i0,i1;
output out;
wire sbar; 

not n1(sbar,sel);
cmos c1(out,i0,sbar,sel);
cmos c2(out,i1,sel,sbar);

endmodule
