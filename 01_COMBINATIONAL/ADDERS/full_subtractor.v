`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2026 22:43:00
// Design Name: 
// Module Name: full_subtractor
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


module full_subtractor(A,B,Bin,Diff,Bout);
input A,B,Bin;
output Diff,Bout;
assign Diff = A^B^Bin;
assign Bout = (B&Bin)|(~A&B)|(~A&Bout);
endmodule
