`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2026 22:31:28
// Design Name: 
// Module Name: Traffic_Light_tb
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


module Traffic_Light_tb;
reg CLK;
wire[2:0] LIGHT;
Traffic_Light Z(CLK,LIGHT);
initial
begin
CLK=1'b0;
forever #5 CLK=~CLK;
end
initial
begin
$monitor($time," CLK=%b,LIGHT=%b",CLK,LIGHT);
#200 $finish;
end
endmodule
