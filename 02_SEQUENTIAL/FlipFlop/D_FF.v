`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 11:57:31
// Design Name: 
// Module Name: D_FF
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


module D_FF(D,S,R,CLK,Q,QBar);
input D,S,R,CLK;
output Q,QBar;
reg Q;
assign QBar = ~Q;
always @(posedge CLK or negedge S or negedge R)
begin
if(S==0) Q<=1;
else if(R==0) Q<=0;
else Q<=D;
end
endmodule

