`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2026 12:53:25
// Design Name: 
// Module Name: 16to1MUX
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


module MUX16to1(d_in,s_in,d_out);
input [15:0]d_in;
input [3:0]s_in;
output d_out;
assign d_out = d_in[s_in];
endmodule
