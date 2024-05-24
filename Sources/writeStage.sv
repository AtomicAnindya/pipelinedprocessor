`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2023 15:48:40
// Design Name: 
// Module Name: writeStage
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


module writeStage(
input logic clk, lowEn, clr,
input logic  memtoregW, 
input logic [31:0] readdataW, aluoutW,
output logic [31:0] resultW,
//input logic pcsrcD,
/////input logic jumpD,
input logic [31:0] pcplus4F,// pcbranchD,
/////input logic [27:0] instrDshifted,
output logic [31:0] pcF
    );
    /////logic [31:0] muxW2in, concat, pcnext;
    
    /////assign concat={pcplus4F[31:28],instrDshifted};///////////
    
    mux2to1#(32) mux2to1_W1(memtoregW,  aluoutW, readdataW, resultW);
    //mux2to1#(32) mux2to1_W2(pcsrcD, pcplus4F, pcbranchD, muxW2in);
    //mux2to1#(32) mux2to1_W3(jumpD, pcplus4F, concat, pcnext );/////////
    
    regZerotoFetch regZerotoFetch(clk, lowEn, clr, pcplus4F, pcF );
endmodule
