`timescale 1ns / 1ps

module GCD_CONTROLLER_IMPROVED(LdA,LdB,Sel1,Sel2,Sel_in,LT,GT,EQ,Done,Start,Clk);

input Clk,Start,LT,GT,EQ;
output reg LdA,LdB,Sel1,Sel2,Sel_in,Done;
reg[2:0] STATE,NEXT_STATE;
parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100, S5=3'b101;

always @(posedge Clk)
STATE<=NEXT_STATE;

always @(*)
begin
LdA=0; LdB=0; Sel1=0; Sel2=0; Sel_in=0; Done=0; NEXT_STATE=STATE;
case(STATE)
S0: begin
    LdA=1;LdB=0;Sel1=0;Sel2=0;Sel_in=1;Done=0;
    if(Start) NEXT_STATE=S1;
    end
S1: begin 
LdA=0;LdB=1;Sel1=0;Sel2=0;Sel_in=1;Done=0;NEXT_STATE=S2;
end
S2: begin 
    if(EQ) begin Done=1;NEXT_STATE=S5; end
    else if(LT) begin
           Sel1=1;Sel2=0;Sel_in=0;NEXT_STATE=S3;
           #1 LdB=1;LdA=0;
           end
    else if(GT) begin
            Sel1=0;Sel2=1;Sel_in=0;NEXT_STATE=S4;
            #1 LdB=0;LdA=1;
            end
     end
S3: begin 
    if(EQ) begin Done=1;NEXT_STATE=S5; end
    else if(LT) begin
           Sel1=1;Sel2=0;Sel_in=0;NEXT_STATE=S3;
           #1 LdB=1;LdA=0;
           end
    else if(GT) begin
            Sel1=0;Sel2=1;Sel_in=0;NEXT_STATE=S4;
            #1 LdB=0;LdA=1;
            end
     end
S4: begin 
    if(EQ) begin Done=1;NEXT_STATE=S5; end
    else if(LT) begin
           Sel1=1;Sel2=0;Sel_in=0;NEXT_STATE=S3;
           #1 LdB=1;LdA=0;
           end
    else if(GT) begin
            Sel1=0;Sel2=1;Sel_in=0;NEXT_STATE=S4;
            #1 LdB=0;LdA=1;
            end
     end
S5: begin LdA=0;LdB=0;Sel1=0;Sel2=0;Sel_in=0;Done=1;NEXT_STATE=S5;end
default: begin LdA=0;LdB=0;NEXT_STATE=S0; end
endcase
end
endmodule