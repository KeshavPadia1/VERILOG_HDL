`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 18:39:39
// Design Name: 
// Module Name: counter
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


module counter(reset,load,d_in,clk,mode,count);

input reset,clk,mode,load;
input[3:0] d_in;
output reg[3:0] count;

always @(posedge clk or posedge reset)
begin
if(reset) count <=0;
else if(load) count = d_in;
else if(mode) count<= count +1;
else count<=count -1;
end
endmodule
