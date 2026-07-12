`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2026 13:01:00
// Design Name: 
// Module Name: testbench
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


module MUX16to1_testbench;
reg[15:0] A;
reg[3:0] B;
wire Y;
MUX16to1_4to1MUX M(.d_in(A),.s_in(B),.d_out(Y));
initial
begin
$monitor($time,"A=%h,B=%h,Y=%b",A,B,Y);
#5 A = 16'h3f0a ; B = 4'h0;
#5 B = 4'h1;
#5 $finish;
end
endmodule
