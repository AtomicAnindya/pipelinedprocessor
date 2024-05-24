`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2023 00:47:58
// Design Name: 
// Module Name: regFetchtoDecode
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


module regFetchtoDecode(
input logic clk, lowEn, clr,
input logic [31:0] anext, bnext,
output logic [31:0] a, b
    );
    always_ff@(posedge clk)
    begin
        if(clr) 
            begin
             a<=0;
             b<=0;
            end
        else if(~lowEn)
            begin
             a<=anext;
             b<=bnext;
            end
        else
            begin 
             a<=a;
             b<=b;
            end
    end
endmodule
