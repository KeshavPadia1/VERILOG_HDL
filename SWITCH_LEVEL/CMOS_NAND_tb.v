`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2026 00:22:12
// Design Name: 
// Module Name: CMOS_NAND_tb
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


module CMOS_NAND_tb;

reg X,Y;
wire F;

CMOS_NAND C1(F,X,Y);

initial
begin 
$monitor($time,"X=%b,Y=%b,F=%b",X,Y,F);
#5 X=1'b0;Y=1'b1;
#5 X=1'b1;Y=1'b1;
#5 $finish;
end 
endmodule
