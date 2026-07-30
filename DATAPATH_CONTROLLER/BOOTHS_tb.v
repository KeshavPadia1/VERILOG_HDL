`timescale 1ns / 1ps

module BOOTHS_tb;

reg Start,Clk;
reg[15:0] Data_in;
wire LdA,LdQ,LdM,ClrA,ClrQ,SftA,SftQ,Clrff,Q0,Qm1,LdCnt,Dec,EqZ,SubAdd,Done;

wire[31:0] R;

BOOTHS_DATAPATH B1(LdA,LdQ,LdM,ClrA,ClrQ,SftA,SftQ,Clrff,Q0,Qm1,LdCnt,Dec,EqZ,SubAdd,Data_in,Clk);
BOOTHS_CONTROLLER B2(LdA,LdQ,LdM,ClrA,ClrQ,SftA,SftQ,Clrff,Q0,Qm1,LdCnt,Dec,EqZ,SubAdd,Start,Done,Clk);

assign R = {B1.A,B1.Q};

initial
begin
Clk=1'b0;
forever #5 Clk=~Clk;
end

initial
#3 Start=1'b1;

initial
begin
$monitor($time," MUL=%d,Done=%b", R,Done);
Data_in=17;
#50 Data_in =5;
#800 $finish;
end
endmodule
