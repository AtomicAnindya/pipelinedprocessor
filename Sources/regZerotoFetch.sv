`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2023 01:05:21
// Design Name: 
// Module Name: regZerotoFetch
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


module regZerotoFetch(
input logic clk, lowEn, clr,
input logic [31:0] anext,
output logic [31:0] a
    ); 
    
    always_ff@(posedge clk)
    begin
        if(clr) a<=0;
        else if(~lowEn) a<=anext;
        else a<=a;
    end

endmodule
