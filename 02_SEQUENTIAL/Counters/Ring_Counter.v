`timescale 1ns / 1ps

module Ring_Counter(CLK,INIT,count);
input CLK,INIT;
output reg[7:0] count;
always @( posedge CLK)
begin
if(INIT) count = 8'b10000000;
else begin
count <= count << 1;
count[0] <= count[7];
end
end
// from blocking: count = {count[6:0],count[7]};
endmodule
