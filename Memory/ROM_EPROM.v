`timescale 1ns / 1ps


module ROM_EPROM(addr,data,rd,cs);

input[2:0] addr;
input rd,cs;
output reg[7:0] data;

always @(addr or rd or cs)
begin
case(addr) 
0: data=24;
1: data =12;
2: data=87;
3: data=23;
4: data=78;
5: data=11;
6: data=14;
7: data= 73;
endcase
end
endmodule
