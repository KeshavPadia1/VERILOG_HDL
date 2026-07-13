`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2026 11:07:14
// Design Name: 
// Module Name: ALU_16Bit
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


module ALU_16Bit(A,B,Z,CARRY,SIGN,PARITY,ZERO,OVERFLOW);
input[15:0] A,B;
output[15:0] Z;
output CARRY,SIGN,PARITY,ZERO,OVERFLOW;
assign {CARRY,Z} = A + B;
assign SIGN = Z[15];
assign PARITY = ~^Z;
assign ZERO = ~|Z;
assign OVERFLOW = (A[15]&B[15]&(~Z[15])) | ((~A[15])&(~B[15])&Z[15]);
endmodule
