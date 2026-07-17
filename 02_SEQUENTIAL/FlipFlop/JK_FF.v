`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2026 15:02:58
// Design Name: 
// Module Name: JK_FF
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


primitive JK_FF(
    output reg Q,
    input CLK,
    input J,
    input K,
    input CLR
    );
 initial
 Q=0;
 table
 // CLK J K CLR : Q : Q_NEW
      ?     ? ? 1 : ? : 0;
      ?    ? ? (10) : ? : -;
     (10) 0 0 0 : ? : -;
     (10)  1 0 0 : ? : 1;
     (10)  0 1 0 : ? : 0;
     (10)  1 1 0 : 0 : 1;
     (10)  1 1 0 : 1 : 0;
     (0?)  ? ? 0 : ? : -;
     0  ?  ?   0  : ? : -;
     1  ?  ?   0  : ? : -;
 endtable
endprimitive
