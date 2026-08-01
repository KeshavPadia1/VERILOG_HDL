`timescale 1ns / 1ps


module ram_1_tb;

reg[9:0] addr;
reg clk,cs,wr,rd;
reg[7:0] memory [1023:0];
wire[7:0] data;
integer k,myseed;

reg[7:0] data_reg;
reg data_drive;

assign data = data_drive?data_reg:8'bz;

ram_1 R1(addr,data,clk,wr,rd,cs);

initial
begin
clk=1'b0;
forever #5 clk=~clk;
end

initial
begin
for(k=0;k<=1023;k=k+1)
begin
addr = k;wr=1;rd=0;cs=1;data_drive=1;
#2 data_reg = (k+k)%256;
#5 wr=0;cs=0;rd=0;data_drive=0;
end
end

initial 
begin
#10300
repeat(20)
begin
rd=1;cs=1;
addr = $random(myseed)%1024;
@(posedge clk)
$display(" addr=%5d, data=%4d",addr,data);
end
end

initial myseed=15;

endmodule
