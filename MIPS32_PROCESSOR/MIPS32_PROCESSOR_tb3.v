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
M1.REGBANK[K] = k;
end 

M1.MEMORY[100] = 143;
M1.MEMORY[200] = 78;

M1.MEMORY[0] = 32'h28020064;          // ADDI R2 R0 100 
M1.MEMORY[1] = 32'h0e94a000;          // OR  R20,R20,R20  -- dummy instr. 
M1.MEMORY[2] = 32'h20440000;          // LW R4 0(R2)
M1.MEMORY[3] = 32'h280300a8;          // ADDI R3 R0 200
M1.MEMORY[4] = 32'h0e94a000;          // OR  R20,R20,R20  -- dummy instr. 
M1.MEMORY[5] = 32'h20450000;          // LW R5 0(R2)
M1.MEMORY[6] = 32'h10853000;          // loop: SLT R6 R4 R5
M1.MEMORY[7] = 32'h0e94a000;          // OR  R20,R20,R20  -- dummy instr. 
M1.MEMORY[8] = 32'h001101 00110 ;     // BNEQZ R6
M1.MEMORY[9] = 32'h04853800;          // SUB R7,R4,R5
M1.MEMORY[10]= 32'h0e94a000;          // OR  R20,R20,R20  -- dummy instr. 
M1.MEMORY[11]= 32'h000e4000;          // ADD R4,R0,R7
M1.MEMORY[12]=                        // 
endmodule
