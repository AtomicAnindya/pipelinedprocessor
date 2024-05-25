`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2023 23:51:40
// Design Name: 
// Module Name: decodeStage
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


module decodeStage(
input logic clk, clr,
input  logic [31:0] instrD, pcplus4D,
input logic forwardAD, forwardBD,
input logic regwriteW,
input logic [4:0] writeregW,
input logic [31:0] aluoutM, resultW,
output logic regwriteE, memtoregE, memwriteE,
output logic [2:0] alucontrolE,
output logic alusrcE, regdstE,
output logic [31:0] rd1E, rd2E,
output logic [4:0] rsE, rtE, rdE,
output logic [31:0] signimmE,
output logic [4:0] rsD, rtD,
output logic branchD,
output logic [27:0] instrDshifted,
output logic jumpD, pcsrcD,
output logic [31:0] pcbranchD
    );
    logic  [31:0] rd1D, rd2D;
    logic [31:0] signimmD;
    logic [31:0] signimmDshifted;
    logic [31:0] eqDa, eqDb; 
    logic eqDout;
    logic regwriteD, memtoregD, memwriteD, alusrcD, regdstD;
    logic [2:0] alucontrolD;
    logic [4:0] rdD;
    logic [31:0]pcbranchDmid;
    
    
    regfile regfile(clk, regwriteW, instrD[25:21], instrD[20:16], writeregW, rd1D, rd2D, resultW );
    signextend sigext(instrD[15:0], signimmD);
    shiftleft2 sl2_D1(signimmD, signimmDshifted);
    adder#(32) adder_D1(pcplus4D, signimmDshifted, pcbranchDmid);///
    assign pcbranchD=pcbranchDmid-32'd4;
    mux2to1#(32) mux2to1_D1(forwardAD, rd1D, aluoutM, eqDa);
    mux2to1#(32) mux2to1_D2(forwardBD, rd2D, aluoutM, eqDb);
    eqcomp eqcomp(eqDa, eqDb, eqDout);

        assign pcsrcD = branchD & eqDout;
    
    control control(instrD[31:26], instrD[5:0], regwriteD, memtoregD,
                     memwriteD, alucontrolD, alusrcD, regdstD, branchD, jumpD);
    regDecodetoExecute regDecodetoExecute(clk, clr, regwriteD,memtoregD,memwriteD, alusrcD, regdstD,
                                            regwriteE, memtoregE, memwriteE, alusrcE, regdstE,
                                            alucontrolD,alucontrolE,rd1D, rd2D,rd1E, rd2E, 
                                            rsD,rtD,rdD,rsE,rtE,rdE,
                                            signimmD,signimmE);
    assign rsD=instrD[25:21];
    assign rtD=instrD[20:16];
    assign rdD=instrD[15:11];
    assign instrDshifted={instrD[25:0],2'b00};
endmodule
