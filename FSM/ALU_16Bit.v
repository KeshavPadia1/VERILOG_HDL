`timescale 1ns / 1ps

module ALU_16Bit(A,B,OPR,Z,SIGN,PARITY,ZERO,OVERFLOW);
input[15:0] A,B;
output reg[15:0] Z;
output SIGN,PARITY,ZERO;
output reg OVERFLOW;
input[1:0] OPR;
reg[31:0] mul_full;
parameter ADD=2'b00, SUB=2'b01, MUL=2'B10, DIV=2'B11;
  
always @(*)
 begin
  case(OPR) 
ADD: 
begin
Z = A+B; 
OVERFLOW = (A[15]&B[15]&(~Z[15])) | ((~A[15])&(~B[15])&Z[15]);
end
SUB: 
begin
Z = A-B; 
OVERFLOW = (A[15]&(~B[15])&(~Z[15])) | ((~A[15])&(B[15])&Z[15]);
end
MUL: 
begin
mul_full = A*B;
OVERFLOW = |mul_full[31:16];
Z = mul_full[15:0];
end
DIV:  
if(B==0) 
begin
Z = 16'hffff;
OVERFLOW = 1;
end
else begin
Z= A/B;
OVERFLOW =0;
end
  endcase
 end
  
assign SIGN = Z[15];
assign PARITY = ~^Z;
assign ZERO = ~|Z;
endmodule
