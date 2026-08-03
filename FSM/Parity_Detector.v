`timescale 1ns / 1ps

module Parity_Detector(CLK,X,Z);

input CLK,X;
output reg Z;

parameter EVEN=0,ODD=1;
reg STATE;

always @(posedge CLK)
begin
case(STATE)
EVEN:STATE<=X?ODD:EVEN;
ODD:STATE<=X?EVEN:ODD;
default:STATE<=EVEN;
endcase
end

always @(STATE)
begin
case(STATE)
EVEN: Z=1'b0;
ODD: Z=1'b1;
default: Z=1'bx;
endcase
end

endmodule
