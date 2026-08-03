`timescale 1ns / 1ps

module PIPE_EX_tb;

parameter N=10;
reg[N-1:0] A,B,C,D;
reg CLK;
wire[N-1:0] F;

PIPE_EX1 P1(F,A,B,C,D,CLK);

initial
begin
CLK=1'b0;
forever #5 CLK=~CLK;
end

initial
begin
$monitor("TIME: %d, F: %d",$time,F);
#5 A=2;B=4;C=3;D=5;
#20 A=1;B=3;C=2;D=4;
#20 A=3;B=5;C=4;D=6;
#500 $finish;
end

endmodule
