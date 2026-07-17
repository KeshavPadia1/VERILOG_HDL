`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2026 12:19:35
// Design Name: 
// Module Name: T_FF
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


primitive T_FF(output reg q,input clk,input clr);
initial
q=0;
table
 // clk clr : q : q_new
     ?   1   : ? : 0;
     ?  (10) : ? : -;
    (10) 0   : 0 : 1;
    (10) 0   : 1 : 0;
    (0?) 0   : ? : -;
endtable
endprimitive
