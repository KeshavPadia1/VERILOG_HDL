`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 13:49:24
// Design Name: 
// Module Name: Parity_Detector_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Parity_Detector_tb;

reg CLK,X;
wire Z;

Parity_Detector Q(CLK,X,Z);

initial
begin
CLK=1'b0;
forever #5 CLK=~CLK;
end

initial
begin
$monitor($time," CLK=%b, X=%b, Z=%b",CLK,X,Z);
#3 X=1; #10 X=1; #10 X=1; 
#20 $finish;
end
endmodule
