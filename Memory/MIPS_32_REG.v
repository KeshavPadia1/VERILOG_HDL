`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2026 00:09:30
// Design Name: 
// Module Name: MIPS_32_REG
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


module MIPS_32_REG(sr1,sr2,dr,rddata1,rddata2,write,wrdata,rst,clk);

input[4:0] sr1,sr2,dr;
input rst,clk,write;
input[31:0] wrdata;
output[31:0] rddata1,rddata2;
integer k;

reg[31:0] regfile[31:0];

assign rddata1 = regfile[sr1];
assign rddata2 = regfile[sr2];

always @(posedge clk)
begin 
if(rst) begin
for(k=0;k<=31;k=k+1) begin
regfile[k] <=0;
end 
end
else begin
if(write) regfile[dr] <= wrdata;
end
end 
 
endmodule
