`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2026 23:43:32
// Design Name: 
// Module Name: Comparator
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


module Comparator(A,B,sel,z);

input[1:0] sel;
input A,B;
output reg z;

always @(*)
begin
case(sel)
2'b00: z = A>B?1:0;
2'b01: z = A<B?1:0;
2'b10: z = A==B?1:0;
2'b11: z = A!=B?1:0;
default: z = 1'bx;
endcase
end

endmodule
