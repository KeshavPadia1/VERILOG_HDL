`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2026 16:07:16
// Design Name: 
// Module Name: SR_FF_tb
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


module SR_FF_tb;
reg S, R, clk, clr;
wire q;
SR_FF Z(q, S, R, clk, clr);
initial
begin
clr = 1;
clk = 1;
forever #5 clk = ~clk;
end
initial
begin
$monitor($time, " S=%b, R=%b, clk=%b, clr=%b, Q=%b",S, R, clk, clr, q);
    #4  S=1;R=0;clr=0;  
    #11 S=0;R=0;
    #11 S=1;R=1;
    #50 $finish;
    end
endmodule
