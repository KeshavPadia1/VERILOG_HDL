`timescale 1ns / 1ps


module ROM_EPROM_tb;

reg[2:0] addr;
reg cs,rd;
wire[7:0] data;

ROM_EPROM R1(addr,data,rd,cs);

initial
begin
$monitor("addr:%5d, Data:%4d",addr,data);
#1 cs=1;rd=1;addr=5;
#5 cs=1;rd=1;addr=6;
#5 $finish;
end

endmodule
