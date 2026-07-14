`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 22:34:55
// Design Name: 
// Module Name: Priority_Encoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Priority_Encoder(in,code);
input[7:0] in;
output reg[2:0] code;
always @(in)
begin
     if(in[0]) code = 3'b000;
else if(in[1]) code = 3'b001;
else if(in[2]) code = 3'b010;
else if(in[3]) code = 3'b011;
else if(in[4]) code = 3'b100;
else if(in[5]) code = 3'b101;
else if(in[6]) code = 3'b110;
else if(in[7]) code = 3'b111;
else code=3'bxxx;
end
endmodule
