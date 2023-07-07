`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2023 00:50:24
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
    output logic [31:0] pcplus4F
    );
    logic [31:0] rd;
    imem imem(pcF, rd);
    regFetchtoDecode regFetchtoDecode(clk, lowEn, clr, rd, pcplus4F, instrD, pcplus4D );

    assign pcplus4F = pcF + 3'b100;
endmodule
