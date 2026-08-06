`timescale 1ns / 1ps

module CMOS_MUX_tb;

reg sel,i0,i1;
wire out;

CMOS_MUX C1(out,sel,i0,i1);

initial
begin 
$monitor($time," out=%b ,sel=%b ,i0=%b ,i1=%b",out,sel,i0,i1);
#5 sel=1;i0=0;i1=1;
#5 sel=0;i0=0;i1=1;
#5 $finish;
end

endmodule
