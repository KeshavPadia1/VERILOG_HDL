`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2026 16:05:37
// Design Name: 
// Module Name: SR_FF
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


module SR_FF(q, S, R, clk, clr);
input S, R, clk, clr;
output reg q;

always @(negedge clk or posedge clr)
begin
    if (clr) 
        q <= 0;
    else begin
        case({S,R})
            2'b00: q <= q;       
            2'b01: q <= 0;       
            2'b10: q <= 1;       
            2'b11: q <= 1'bx;    
endcase
end
end
endmodule
