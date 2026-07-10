`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2026 20:30:41
// Design Name: 
// Module Name: half_subtractor_tb
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


module half_subtractor_tb;
reg A,B;
wire DIFF,BORR;
half_subtractor h(A,B,DIFF,BORR);
initial
begin
$monitor($time,"A=%b,B=%b,DIFF=%b,BORR=%b",A,B,DIFF,BORR);
#5 A=0;B=1;
#5 A=1;B=0;
#5 $finish;
end
endmodule
