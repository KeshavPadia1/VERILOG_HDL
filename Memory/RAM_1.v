`timescale 1ns / 1ps


module ram_1(addr,data,clk,wr,rd,cs);

input[9:0] addr; // as 2 power 10 = 1024 i.e 1K byte
reg[7:0] memory [1023:0];
inout[7:0] data;
input clk,cs,wr,rd;
reg[7:0] d_out;

assign data = (cs && rd)? d_out : 8'bz;

always @(posedge clk) // we can keep this asynchronous also like to the change of addr,cs,rd,wr
if(cs && wr && !rd) memory[addr] = data;

always @(posedge clk)
if(cs && rd && !wr) d_out = memory[addr];

endmodule
