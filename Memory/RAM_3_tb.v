`timescale 1ns / 1ps


module RAM_3_tb;

reg[9:0] addr;
reg cs,wr;
wire[7:0] data_out;
reg[7:0] data_in;
integer k,myseed;

RAM_3 R1(data_in,data_out,addr,cs,wr);

initial
begin
for(k=0;k<=1023;k=k+1)
begin
addr = k;
#1 wr=1;cs=1; data_in = (k+k)%256;
#5 wr=0;cs=0;
end
end

initial 
begin
#10300
repeat(20)
begin
#1 cs=1;
#1 addr = $random(myseed)%1024;
#1 $display(" addr=%5d, data=%4d",addr,data_out);
end
end

initial myseed=15;

endmodule
