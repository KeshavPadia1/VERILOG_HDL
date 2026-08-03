`timescale 1ns / 1ps

module PIPE_EX2(Z,rs1,rs2,rd,func,addr,clk1,clk2);

input[3:0] rs1,rs2,rd,func;
input[7:0] addr;
input clk1,clk2;
output[15:0] Z;

reg[15:0] L12_A,L12_B,L23_Z,L34_Z;
reg[7:0] L12_addr,L23_addr,L34_addr;
reg[3:0] L12_rd,L23_rd,L12_func;

reg[15:0] memory[255:0];
reg[15:0] regbank[15:0];

assign Z = L34_Z;

always @(posedge clk1)
begin 
L12_A <= #2 regbank[rs1];
L12_B <= #2 regbank[rs2];
L12_addr <= #2 addr;
L12_func <= #2 func;
L12_rd <= #2 rd;
end 

always @(negedge clk2)
begin 
L23_rd <= #2 L12_rd;
L23_addr <= #2 L12_addr;
case(L12_func) 
0: L23_Z <= #2 L12_A + L12_B;
1: L23_Z <= #2 L12_A - L12_B;
2: L23_Z <= #2 L12_A * L12_B;
3: L23_Z <= #2 L12_A;
4: L23_Z <= #2 L12_B;
5: L23_Z <= #2 L12_A & L12_B;
6: L23_Z <= #2 L12_A | L12_B;
7: L23_Z <= #2 L12_A ^ L12_B;
8: L23_Z <= #2 ~L12_A;
9: L23_Z <= #2 ~L12_B;
10: L23_Z <= #2 L12_A >> 1;
11: L23_Z <= #2 L12_B << 1;
default: L23_Z <= #2 16'bxxxx;
endcase
end

always @(posedge clk1)
begin 
L34_Z <= #2 L23_Z;
regbank[rd] <= L23_Z;
L34_addr <= L23_addr;
end

always @(negedge clk2)
begin 
memory[L34_addr] <= L34_Z;
end

endmodule
