`timescale 1ns / 1ps

module RAM_3(data_in,data_out,addr,cs,wr);

parameter wordsize = 8, addr_size=10, memory_size=1024;
input[addr_size-1:0] addr; 
input[wordsize-1:0] data_in;
output[wordsize-1:0] data_out;
reg[wordsize-1:0] memory[memory_size-1:0];
input cs,wr;

assign data_out = memory[addr];

always @(wr or cs)
if(wr) memory[addr] = data_in;
endmodule
