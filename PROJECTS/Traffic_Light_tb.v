`timescale 1ns / 1ps


module Traffic_Light_tb;
reg CLK;
wire[2:0] LIGHT;
Traffic_Light Z(CLK,LIGHT);
initial
begin
CLK=1'b0;
forever #5 CLK=~CLK;
end
initial
begin
$monitor($time," CLK=%b,LIGHT=%b",CLK,LIGHT);
#200 $finish;
end
endmodule
