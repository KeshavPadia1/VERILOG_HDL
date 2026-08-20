`timescale 1ns / 1ps

module MIPS32_PROCESSOR_tb3;

reg CLK1,CLK2;
integer K;
MIPS32_PROCESSOR M1(CLK1,CLK2);

initial
begin
CLK1=1'b0;
forever #5 CLK1 = ~CLK1;
end

initial
begin
CLK2=1'b1;
forever #5 CLK2 = ~CLK2;
end

initial
begin

for(K=0;K<32;K=K+1)
begin
M1.REGBANK[K] = K;
end 

M1.MEMORY[0]  = 32'h28020064;  // ADDI R2,R0,100
M1.MEMORY[1]  = 32'h280300c8;  // ADDI R3,R0,200
M1.MEMORY[2]  = 32'h0e94a000;  // dummy
M1.MEMORY[3]  = 32'h0e94a000;  // dummy
M1.MEMORY[4]  = 32'h20440000;  // LW   R4,0(R2)
M1.MEMORY[5]  = 32'h20650000;  // LW   R5,0(R3)
M1.MEMORY[6]  = 32'h0e94a000;  // dummy  
M1.MEMORY[7]  = 32'h0e94a000;  // dummy

M1.MEMORY[8]  = 32'h04853800;  // SUB  R7,R4,R5
M1.MEMORY[9]  = 32'h0e94a000;  // dummy
M1.MEMORY[10]  = 32'h0e94a000; // dummy
M1.MEMORY[11]  = 32'h38e00008; // BEQZ R7,Done   (offset: 8)
M1.MEMORY[12] = 32'h10853000;  // SLT  R6,R4,R5
M1.MEMORY[13] = 32'h0e94a000;  // dummy
M1.MEMORY[14] = 32'h0e94a000;  // dummy
M1.MEMORY[15] = 32'h34c00002;  // BNEQZ R6,ElseBigger  (offset: 2)
M1.MEMORY[16] = 32'h04852000;  // SUB  R4,R4,R5
M1.MEMORY[14] = 32'h0e94a000;  // dummy
M1.MEMORY[14] = 32'h0e94a000;  // dummy
M1.MEMORY[17] = 32'h3800fff4;  // BEQZ R0,Loop   (offset: -12)

M1.MEMORY[18] = 32'h04a42800;  // SUB  R5,R5,R4
M1.MEMORY[19] = 32'h3800fff2;  // BEQZ R0,Loop   (offset: -14)

M1.MEMORY[20] = 32'h280600c7;  // ADDI R6,R0,199
M1.MEMORY[21] = 32'h0e94a000;  // dummy
M1.MEMORY[22] = 32'h24c40000;  // SW   R4,0(R6)
M1.MEMORY[23] = 32'hfc000000;  // HLT

M1.MEMORY[100] = 143;
M1.MEMORY[200] = 78;

M1.PC=0;
M1.TAKEN_BRANCH=0;
M1.HALTED=0;
M1.IF_ID_IR=32'h0e94a000;

#3000 $display("GCD OF %4d and %4d is %4d",M1.MEMORY[100],M1.MEMORY[200],M1.MEMORY[199]);
#10 $finish;

end
endmodule
