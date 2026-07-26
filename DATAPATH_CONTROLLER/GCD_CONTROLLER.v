`timescale 1ns / 1ps

module GCD_CONTROLLER(LdA,LdB,Sel1,Sel2,Sel_in,LT,GT,EQ,Done,Start,Clk);

input Clk,Start;
output reg LdA,LdB,Sel1,Sel2,Sel_in,LT,GT,EQ,Done;

reg[2:0] STATE;
parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100, S5=3'b101;

always @(posedge Clk)
begin
case(STATE)
S0: if(Start) STATE<=S1;
S1: STATE<=S2;
S2: #2 if(LT) STATE<=S3;
       else if(GT) STATE<=S4;
       else if(EQ) STATE<=S5;
S3: #2 if(LT) STATE<=S3;
       else if(GT) STATE<=S4;
       else if(EQ) STATE<=S5;
S4: #2 if(LT) STATE<=S3;
       else if(GT) STATE<=S4;
       else if(EQ) STATE<=S5;
S5: STATE<=S5;
default: STATE<=S0;
endcase
end

always @(STATE)
begin
case(STATE)
S0: begin LdA=1;LdB=0;Sel1=0;Sel2=0;Sel_in=1;LT=0;GT=0;EQ=0;Done=0; end
S1: begin LdA=0;LdB=1;Sel1=0;Sel2=0;Sel_in=1;LT=0;GT=0;EQ=0;Done=0; end
S2: begin 
    if(EQ) Done=1;
    else if(LT) begin
           Sel1=1;Sel2=0;Sel_in=0;
           #1 LdB=1;LdA=0;
           end
    else if(GT) begin
            Sel1=0;Sel2=1;Sel_in=0;
            #1 LdB=0;LdA=1;
            end
     end
S3: begin 
    if(EQ) Done=1;
    else if(LT) begin
           Sel1=1;Sel2=0;Sel_in=0;
           #1 LdB=1;LdA=0;
           end
    else if(GT) begin
            Sel1=0;Sel2=1;Sel_in=0;
            #1 LdB=0;LdA=1;
            end
     end
S4: begin 
    if(EQ) Done=1;
    else if(LT) begin
           Sel1=1;Sel2=0;Sel_in=0;
           #1 LdB=1;LdA=0;
           end
    else if(GT) begin
            Sel1=0;Sel2=1;Sel_in=0;
            #1 LdB=0;LdA=1;
            end
     end
S5: begin LdA=0;LdB=0;Sel1=0;Sel2=0;Sel_in=0;Done=1; end
endcase
end

endmodule
