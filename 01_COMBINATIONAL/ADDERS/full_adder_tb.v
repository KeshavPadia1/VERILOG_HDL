`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 12:25:28
// Design Name: 
// Module Name: full_adder_tb
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


module full_adder_tb;
reg A,B,Cin; wire SUM,CARRY;
full_adder DUT(A,B,Cin,SUM,CARRY);
initial
begin
$monitor($time ," A=%b,B=%b,Cin=%b,SUM=%b,CARRY=%b",A,B,Cin,SUM,CARRY);
#5 A=1;B=0;Cin=1;
#5 A=1;B=1;Cin=0;
#5 A=0;B=1;Cin=0;
#5 A=0;B=0;Cin=1;
#5 A=1;B=1;Cin=1;
#5 $finish;
end
endmodule
