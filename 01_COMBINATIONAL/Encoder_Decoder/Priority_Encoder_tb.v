`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 22:44:05
// Design Name: 
// Module Name: Priority_Encoder_tb
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


module Priority_Encoder_tb;
reg[7:0] in;
wire[2:0] code;
Priority_Encoder P(in,code);
initial
begin
$monitor($time," in=%b,code=%b",in,code);
#5 in=8'b00000010;
#5 $finish;
end
endmodule
