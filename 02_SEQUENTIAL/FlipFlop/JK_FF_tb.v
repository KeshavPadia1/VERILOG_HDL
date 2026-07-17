`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2026 15:15:51
// Design Name: 
// Module Name: J_FF_tb
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


module J_FF_tb;
    wire Q;
    reg CLK,J,K,CLR;
    JK_FF Z(Q,CLK,J,K,CLR);
    initial
    begin
    CLR=1;
    CLK=1;
    forever #5 CLK=~CLK;
    end
    initial
    begin
    $monitor($time," CLK=%b,J=%b,K=%b,CLR=%b,Q=%b",CLK,J,K,CLR,Q);
    #4  J=1;K=0;CLR=0;  
    #11 J=0;K=0;
    #11 J=1;K=1;
    #50 $finish;     
    end
endmodule
