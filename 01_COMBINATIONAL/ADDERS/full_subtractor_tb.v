`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2026 00:40:10
// Design Name: 
// Module Name: full_subtractor_tb
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


module full_subtractor_tb;
reg A,B,Bin;
wire Diff,Bout;
full_subtractor F(A,B,Bin,Diff,Bout);
initial
begin
$monitor($time,"A=%b,B=%b,Bin=%b,Diff=%b,Bout=%b",A,B,Bin,Diff,Bout);
#5 A=0;B=1;Bin=0;
#5 A=1;B=1;Bin=1;
#5 A=1;B=0;Bin=1;
#5 $finish;
end
endmodule
