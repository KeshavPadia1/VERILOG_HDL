`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2026 22:16:37
// Design Name: 
// Module Name: Traffic_Light
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


module Traffic_Light(CLK,LIGHT);

input CLK;
output reg[2:0] LIGHT;

parameter S0=0,S1=1,S2=2;
parameter RED=3'b001,GREEN=3'b010,YELLOW=3'b100;

reg[1:0] STATE;

always @(posedge CLK)
begin
case(STATE)
S0: STATE<=S1;
S1: STATE<=S2;
S2: STATE<=S0;
default: STATE<=S0;
endcase
end

always @(STATE)
begin
case(STATE)
S0: LIGHT=RED;
S1: LIGHT=GREEN;
S2: LIGHT=YELLOW;
default: LIGHT=RED;
endcase
end
endmodule
