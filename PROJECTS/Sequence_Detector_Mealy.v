`timescale 1ns / 1ps

module Sequence_Detector_Mealy(X,Z,CLK,CLR); // it detects 0110

input CLK,X,CLR;
output reg Z;
reg [1:0] STATE;
parameter S0=0,S1=1,S2=2,S3=3;

always @(posedge CLK or posedge CLR)
begin
    if(CLR) STATE <= S0;
    else
    case(STATE)
        S0: STATE <= X?S0:S1;
        S1: STATE <= X?S2:S1;
        S2: STATE <= X?S3:S1;
        S3: STATE <= X?S0:S1;
        default: STATE <= S0;
    endcase
end

always @(*)
begin
    if(STATE==S3 && X==0) Z=1;
    else Z=0;
end
endmodule