`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 12:00:10
// Design Name: 
// Module Name: Shift_Register
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


module Shift_Register(A,B,C,D,E,CLK,CLR);
input A,CLK,CLR;
output reg B,C,D,E;

always @(posedge CLK or negedge CLR)
begin
if(!CLR) begin
B=0;
C=0;
D=0;
E=0;
end
else begin
E<=D;
D<=C;
C<=B;
B<=A;
end
end
endmodule
