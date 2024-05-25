`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2023 21:32:46
// Design Name: 
// Module Name: fetchStage
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


module fetchStage(
    input logic clk,
    input logic lowEn,
    input logic clr,
    input logic [31:0] pcF,
    output logic [31:0] pcplus4D,
    output logic [31:0] instrD,
    output logic [31:0] pcplus4F,
    input logic pcsrcD,
    input logic [31:0] pcbranchD,
    input logic reset,
    input logic jumpD,
    input logic [27:0] instrDshifted
    );
    logic [31:0] rd;
    logic [31:0] pcFnew, pcFnew2;
    logic pcsrcDnew;
    
    logic [31:0]  concat;
    assign concat = {pcplus4F[31:28],instrDshifted};
    
    imem imem(pcFnew2, rd);
    regFetchtoDecode regFetchtoDecode(clk, lowEn, clr, rd, pcplus4F, instrD, pcplus4D );
    
    mux2to1 #(32)mux2to1_D(pcsrcDnew,pcF,pcbranchD,pcFnew);
    mux2to1 #(1)mux2to1_D2(reset,pcsrcD,~reset,pcsrcDnew);
    
    always_comb
    begin
        case(jumpD)
        1'b0: pcFnew2=pcFnew;
        1'b1: pcFnew2=concat;
        default:pcFnew2=pcFnew;
        endcase
    end
    //chnaged from pc+4 to pc+1
    assign pcplus4F = pcFnew2 + 4'b0100; //////again reverted
endmodule
