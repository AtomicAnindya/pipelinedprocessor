`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2023 00:33:01
// Design Name: 
// Module Name: mips
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


module mips(
input logic hazreset,
input logic clk, reset,
output logic memwriteM,
output logic [31:0] writedataM,
output logic [31:0] aluoutM

    );
    //hazunit logics
    logic stallF;
    logic stallD, flushE;
    logic forwardAD, forwardBD;
    logic [1:0] forwardAE, forwardBE;
    logic branchD;
    logic [4:0] rsD, rtD, rsE, rtE;
    logic [4:0] writeregE, writeregM, writeregW;
    logic memtoregE, regwriteE, memtoregM, regwriteM, regwriteW;
    
    //writeStage logics
    logic  memtoregW; 
    logic [31:0] readdataW, aluoutW;
    logic [31:0] resultW;
    logic pcsrcD, jumpD;
    logic [31:0] pcplus4F, pcbranchD;
    logic [27:0] instrDshifted;
    logic [31:0] pcF;
    
    //fetchStage logics
    logic feclr;
    logic [31:0] instrD, pcplus4D;
    
    //decodeStage logics
    logic [31:0] signimmE, rd1E, rd2E;
    logic [4:0] rdE;
    logic alusrcE, regdstE;
    logic [2:0] alucontrolE;
    logic memwriteE;
//    logic [31:0] aluoutM;
    
    //executeStage logics
//    logic memwriteM;
//    logic [31:0] writedataM;
    
    
    hazunit hazunit(stallF, stallD, flushE,forwardAD, forwardBD,forwardAE, forwardBE,branchD, 
             rsD, rtD, rsE, rtE,
             writeregE, writeregM, writeregW, memtoregE, regwriteE, memtoregM, regwriteM, regwriteW,
             hazreset);
             
    writeStage writeStage(clk, stallF, reset, memtoregW,readdataW, aluoutW,resultW,
                          pcsrcD, jumpD, pcplus4F, pcbranchD,instrDshifted, pcF);
          
          assign feclr = pcsrcD | jumpD; 
         
                         
    fetchStage fetchStage( clk, stallD, feclr, pcF, pcplus4D, instrD, pcplus4F);
    
    decodeStage decodeStage(clk, flushE,
                        instrD, pcplus4D,
                        forwardAD, forwardBD,
                        regwriteW,
                        writeregW,
                        aluoutM, resultW,
                        regwriteE, memtoregE, memwriteE,
                        alucontrolE,
                        alusrcE, regdstE,
                        rd1E, rd2E,
                        rsE, rtE, rdE,
                        signimmE,
                        rsD, rtD,
                        branchD,
                        instrDshifted,
                        jumpD, pcsrcD,
                        pcbranchD);
                        
    executeStage executeStage(clk, regwriteE, memtoregE, memwriteE,
                        alucontrolE,
                        alusrcE, regdstE, 
                        rd1E, rd2E,
                        rtE, rdE,
                        signimmE,
                        resultW,
                        forwardAE, forwardBE,
                        writeregE,
                        writeregM,
                        writedataM,
                        aluoutM,
                        memwriteM,
                        memtoregM,
                        regwriteM );
                        
    memoryStage memoryStage(clk,
                        regwriteM, memtoregM, memwriteM,
                        aluoutM, writedataM,
                        writeregM,
                        regwriteW, memtoregW,
                        readdataW, aluoutW,
                        writeregW);

endmodule

