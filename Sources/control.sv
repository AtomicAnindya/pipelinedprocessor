`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2023 21:47:13
// Design Name: 
// Module Name: control
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


module control(
    input logic [5:0] op,
    input logic [5:0] funct,
    output logic regwriteD,
    output logic memtoregD,
    output logic memwriteD,
    output logic [2:0] alucontrolD,
    output logic alusrcD,
    output logic regdstD,
    output logic branchD,
    output logic jumpD
    );
    logic [1:0] aluop;
    logic branch;
    
    maindec md(op, memtoregD, memwriteD, branchD, alusrcD, regdstD, regwriteD, jumpD, aluop);
    aludec  ad(funct, aluop, alucontrolD);
    
    
    
    
endmodule
