`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2026 14:13:01
// Design Name: 
// Module Name: Ripple_Counter
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


module Ripple_Counter(input clk,input clr,output[6:1] q);
T_FF T1(q[1],clk,clr);
T_FF T2(q[2],q[1],clr);
T_FF T3(q[3],q[2],clr);
T_FF T4(q[4],q[3],clr);
T_FF T5(q[5],q[4],clr);
T_FF T6(q[6],q[5],clr);
endmodule
