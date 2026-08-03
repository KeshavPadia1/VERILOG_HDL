`timescale 1ns / 1ps


module PIPE_EX2_tb;

reg[3:0] rs1,rs2,rd,func;
reg[7:0] addr;
reg clk1,clk2;
wire[15:0] Z;
integer k;

PIPE_EX2 P1(Z,rs1,rs2,rd,func,addr,clk1,clk2);

initial
begin 
clk1 = 1'b0;
forever #5 clk1 = ~clk1;
end

initial
begin 
clk2 = 1'b1;
forever #5 clk2 = ~clk2;
end 

initial 
begin 
for(k=0;k<=15;k=k+1)
begin 
P1.regbank[k] <= k;
end
end

initial
begin 
$monitor("TIME: %4d, RESULT: %4d",$time,Z);
#5 rs1=3;rs2=5;rd=11;func=0;addr=125;
#10 rs1=4;rs2=6;rd=12;func=2;addr=126;
#10 rs1=8;rs2=7;rd=13;func=3;addr=127;
#200 for(k=125;k<=127;k=k+1)
begin 
$display("MEM[%3d] = %3d",k,P1.memory[k]);
end
#100 $finish;
end

endmodule
