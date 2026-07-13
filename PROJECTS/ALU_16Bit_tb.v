`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2026 11:16:02
// Design Name: 
// Module Name: ALU_16Bit_tb
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


module ALU_16Bit_tb;
reg[15:0] A,B;
wire[15:0] Z;
wire CARRY,SIGN,PARITY,ZERO,OVERFLOW;
ALU_16Bit ALU(A,B,Z,CARRY,SIGN,PARITY,ZERO,OVERFLOW);
initial
begin
$monitor($time,"A=%b,B=%b,Z=%b,CARRY=%b,SIGN=%b,PARITY=%b,ZERO=%b,OVERFLOW=%b",A,B,Z,CARRY,SIGN,PARITY,ZERO,OVERFLOW);
#5 A=16'h28f6;B=16'haa32;
#5 A=16'h1111;B=16'habcd;
#5 $finish;
end
endmodule
