`timescale 1ns / 1ps


module GCD_tb;

reg[15:0] Data_in;
reg Clk,Start;
wire Done,LdA,LdB,Sel1,Sel2,Sel_in,LT,GT,EQ;

GCD_DATAPATH G1(LdA,LdB,Sel1,Sel2,Sel_in,LT,GT,EQ,Data_in,Clk);
GCD_CONTROLLER G2(LdA,LdB,Sel1,Sel2,Sel_in,LT,GT,EQ,Done,Start,Clk);

initial
begin
Clk = 1'b0;
forever #5 Clk=~Clk;
end

initial
begin
#2 Start=1'b1;
end

initial
begin
$monitor($time," GCD=%d, Done=%b",G1.Aout,Done);
#17 Data_in=143;
#10 Data_in=78;
#100 $finish;
end

endmodule
