`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 20:36:10
// Design Name: 
// Module Name: Ring_Counter_tb
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


module Ring_Counter_tb;
reg clk,init;
wire[7:0] count;
Ring_Counter R(clk,init,count);
initial 
begin
clk=1'b0;
forever #5 clk=~clk;
end
initial
begin
$monitor($time,"CLK=%b,INIT=%b,COUNT=%b",clk,init,count);
#5 init=1;
#5 init=0;
#200 $finish;
end
endmodule
