`timescale 1ns / 1ps

module MUL_tb;

reg[15:0] Data_in;
reg Clk,START;
wire RST,Done,LdA,LdB,LdP,ClrP,DecB,EqZ;

MUL_DATAPATH M1(LdA,LdB,LdP,ClrP,DecB,EqZ,Data_in,Clk);
MUL_CONTROLLER M2(Clk,RST,Done,EqZ,START,LdA,LdB,LdP,ClrP,DecB);

initial
begin
Clk=1'b0;
forever #5 Clk=~Clk;
end

initial 
begin
#3 START=1'b1;
end 

initial
begin
$monitor($time, " %d %b",M1.Y,Done);
#17 Data_in = 17;
#10 Data_in = 5;
#500 $finish;
end 

endmodule
