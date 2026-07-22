`timescale 1ns / 1ps

module MUL_CONTROLLER(Clk,RST,Done,EqZ,START,LdA,LdB,LdP,ClrP,DecB);

input Clk,EqZ,START,RST;
output reg LdA,LdB,LdP,ClrP,DecB,Done;

reg[2:0] STATE;
parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100, S5=3'b101;

always @(posedge Clk)
begin
case(STATE)
S0: if(START) STATE<=S1;
S1: STATE<=S2;
S2: STATE<=S3;
S3: #2 if(EqZ) STATE<=S4; // delay is for synchronization
S4: STATE<=S4;
default: STATE<=S0;
endcase
end

always @(STATE)
begin
case(STATE)
S0: begin #1 LdA=0; LdB=0; LdP=0; ClrP=0; DecB=0; Done=0; end
S1: begin #1 LdA=1; LdB=0; LdP=0; ClrP=0; DecB=0; Done=0; end
S2: begin #1 LdA=0; LdB=1; ClrP=1; end
S3: begin #1 LdP=1; DecB=1; ClrP=0; LdB=0; end
S4: begin #1 LdP=0; DecB=0; Done=1; end
endcase
end 

endmodule
