`timescale 1ns / 1ps

module MIPS_32_REG_tb;

reg[4:0] sr1,sr2,dr;
reg rst,clk,write;
reg[31:0] wrdata;
wire[31:0] rddata1,rddata2;
integer k;

MIPS_32_REG M1(sr1,sr2,dr,rddata1,rddata2,write,wrdata,rst,clk);

initial
begin
clk=1'b0;
forever #5 clk=~clk;
end 

initial 
begin 
#1 rst=1;
#5 rst=0;
end 

initial
begin 
#7
for(k=0;k<=31;k=k+1)
begin 
dr=k; wrdata=10*k; write=1;
#10 write=0;
end

#10 
for(k=0;k<=31;k=k+2)
begin 
sr1=k;sr2=k+1;
#5 
$display("reg[%2d] = %d, reg[%2d] = %d",sr1,rddata1,sr2,rddata2);
end
#1000 $finish;

end
endmodule
