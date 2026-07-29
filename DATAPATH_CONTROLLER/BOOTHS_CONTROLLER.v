`timescale 1ns / 1ps

module BOOTHS_CONTROLLER(LdA,LdQ,LdM,ClrA,ClrQ,SftA,SftQ,Clrff,Q0,Qm1,LdCnt,Dec,EqZ,SubAdd,Start,Done,Clk);

input EqZ,Qm1,Clk,Q0,Start;
output reg LdA,LdQ,LdM,ClrA,ClrQ,SftA,SftQ,Clrff,LdCnt,Dec,SubAdd,Done;

reg[2:0] STATE;
parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100,S5=3'b101,S6=3'b110;

always @(posedge Clk)
begin
case(STATE)
S0: if(Start) STATE<=S1;
S1: STATE<=S2;
S2: begin
    if({Q0,Qm1} == 2'b01) STATE<=S3;
    else if({Q0,Qm1} == 2'b10) STATE<=S4;
    else if({Q0,Qm1} == 2'b00 || {Q0,Qm1} == 2'b11) STATE<=S5;
    end
S3: STATE<=S5;
S4: STATE<=S4;
S5: begin
    if(EqZ) STATE<=S6;
    else begin
    if({Q0,Qm1} == 2'b01) STATE<=S3;
    else if({Q0,Qm1} == 2'b10) STATE<=S4;
    else if({Q0,Qm1} == 2'b00 || {Q0,Qm1} == 2'b11) STATE<=S5; 
    end
    end
S6: STATE<=S6;
default: STATE<=S0;
endcase
end 

always @(STATE)
begin
case(STATE)
S0: begin LdA=0;LdQ=0;LdM=0;ClrA=0;ClrQ=0;SftA=0;SftQ=0;Clrff=0;LdCnt=0;Dec=0;Done=0; end
S1: begin LdM=1;ClrA=1;Clrff=1;LdCnt=1; end
S2: begin LdM=0;ClrA=0;Clrff=0;LdCnt=0;LdQ=1; end
S3: begin LdQ=0;SubAdd=0;LdA=1; end
S4: begin SubAdd=1;LdA=1; end 
S5: begin Dec=1;SubAdd=0;LdA=0;SftA=1;SftQ=1; end
S6: begin Done=1; end
default: begin LdA=0;LdQ=0;LdM=0;ClrA=0;ClrQ=0;SftA=0;SftQ=0;Clrff=0;LdCnt=0;Dec=0;Done=0; end 
endcase
end
endmodule 
    
