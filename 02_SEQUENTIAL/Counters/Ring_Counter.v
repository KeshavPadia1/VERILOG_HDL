`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 20:23:39
// Design Name: 
// Module Name: Ring_Counter
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


module Ring_Counter(CLK,INIT,count);
input CLK,INIT;
output reg[7:0] count;
always @( posedge CLK)
begin
if(INIT) count = 8'b10000000;
else begin
count <= count << 1;
count[0] <= count[7];
end
end
// from blocking: count = {count[6:0],count[7]};
endmodule
