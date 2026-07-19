`timescale 1ns / 1ps

module Sequence_Detector_tb; // it detects 0110
reg CLK,X,CLR;
wire Z;
Sequence_Detector Q(X,Z,CLK,CLR);
initial
begin
CLR=1'b1;
CLK=1'b0;
forever #5 CLK=~CLK;
end

initial
begin
$monitor($time," CLK=%b, CLR=%b, X=%b, Z=%b",CLK,CLR,X,Z);
#3 CLR=0; X=0;
#10 X=1;
#10 X=1;
#10 X=0;
#10 X=1;
#10 X=1;
#10 X=0;
#20 $finish;
end
endmodule
