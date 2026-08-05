`timescale 1ns / 1ps

module CMOS_INVERTER_tb;

reg x;
wire f;

CMOS_INVERTER C1(x,f);

initial
begin 
$monitor($time,"X=%b,F=%b",x,f);
#5 x=1'b0;
#5 x=1'b1;
#5 $finish;
end 

endmodule
