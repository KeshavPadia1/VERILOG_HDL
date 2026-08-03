`timescale 1ns / 1ps

module Sequence_Detector(X,Z,CLK,CLR); // it detects 0110
input CLK,X,CLR;
output reg Z;

reg[2:0] STATE;
parameter S0=0,S1=1,S2=2,S3=3,S4=4;

always @(posedge CLK or posedge CLR)
begin
if(CLR) STATE<=S0;
else
begin
case(STATE)
S0: STATE<=X?S0:S1;
S1: STATE<=X?S2:S1;
S2: STATE<=X?S3:S1;
S3: STATE<=X?S0:S4;
S4: STATE<=X?S2:S1;
default: STATE<=S0;
endcase
end
end

always @(*)
begin
if(STATE==S4) Z=1;
else Z=0;
end


endmodule
