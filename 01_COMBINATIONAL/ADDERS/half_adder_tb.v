`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2026 19:32:25
// Design Name: 
// Module Name: half_adder_tb
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


module half_adder_tb;
reg A,B;
wire SUM,CARRY;
half_adder_structural H(A,B,SUM,CARRY);
initial
begin
$monitor($time,"A=%b,B=%b,SUM=%b,CARRY=%b",A,B,SUM,CARRY);
#5 A=0;B=0;
#5 A=0;B=1;
#5 A=1;B=0;
#5 A=1;B=1;
#5 $finish;
end
endmodule
