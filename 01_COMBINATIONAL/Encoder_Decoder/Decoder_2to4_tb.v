`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2026 19:56:21
// Design Name: 
// Module Name: Decoder_tb
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


module Decoder_tb;
reg[1:0] sel;
wire[3:0] out;
Decoder D(sel,out);
initial
begin
$monitor($time,"sel=%b,out=%b",sel,out);
#5 sel=2'b01;
#5 sel=2'b10;
#5 $finish;
end
endmodule
