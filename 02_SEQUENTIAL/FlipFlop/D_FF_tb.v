`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 12:23:10
// Design Name: 
// Module Name: D_FF_tb
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


module D_FF_tb;
reg D,S,R,CLK;
wire Q,QBar;
D_FF Z(D,S,R,CLK,Q,QBar);
initial
begin
$monitor($time," D=%b,S=%b,R=%b,CLK=%b,Q=%b,QBar=%b",D,S,R,CLK,Q,QBar);
#5 D=1;S=0;R=1;
#5 D=0;S=1;R=0;
#5 D=1;S=1;R=1;
#5 $finish;
end
initial
begin
CLK=1'b0;
forever #5 CLK=~CLK;
end
endmodule
