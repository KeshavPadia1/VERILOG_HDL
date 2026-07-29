`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2026 20:59:25
// Design Name: 
// Module Name: BOOTHS_CONTROLLER
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


module BOOTHS_tb;

reg Start,Clk;
wire LdA,LdQ,LdM,ClrA,ClrQ,SftA,SftQ,Clrff,Q0,Qm1,LdCnt,Dec,EqZ,SubAdd,Done;

BOOTHS_DATAPATH B1(LdA,LdQ,LdM,ClrA,ClrQ,SftA,SftQ,Clrff,Q0,Qm1,LdCnt,Dec,EqZ,SubAdd,Data_in,Clk);
BOOTHS_CONTROLLER B2(LdA,LdQ,LdM,ClrA,ClrQ,SftA,SftQ,Clrff,Q0,Qm1,LdCnt,Dec,EqZ,SubAdd,Start,Done,Clk);

initial
begin
Clk=1'b0;
forever #5 Clk=~Clk;
end

initial
#3 Start=1'b1;

initial
begin
$monitor($time," MUL=%d,Done=%b",
endmodule
