`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2024 10:17:07
// Design Name: 
// Module Name: MIPS
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


module MIPS(
input logic hazreset,
input logic clk, reset,
output logic memwriteM,
output logic [31:0] writedataM,
output logic [31:0] aluoutM

    );
    logic [31:0] pcF;
    logic stallF;
    logic [31:0] instrD, pcplus4D;
    logic [4:0] rsD, rtD, rsE, rtE;
    logic [4:0] writeregE, writeregM, writeregW;
    logic memtoregE, regwriteE, memtoregM, regwriteM, regwriteW;
    logic [31:0] resultW;
    logic [31:0] signimmE, rd1E, rd2E;
    logic [4:0] rdE;
    logic alusrcE, regdstE;
    logic [2:0] alucontrolE;
    logic memwriteE;
    logic pcsrcD, jumpD;
    logic [31:0] pcplus4F, pcbranchD;

    //hazunit logics
//    logic stallF,
    logic stallD, flushE;
    logic forwardAD, forwardBD;
    logic [1:0] forwardAE, forwardBE;
    logic branchD;
//    logic [4:0] rsD, rtD, rsE, rtE;
//    logic [4:0] writeregE, writeregM, writeregW;
//    logic memtoregE, regwriteE, memtoregM, regwriteM, regwriteW;
    
    //writeStage logics
    logic  memtoregW; 
    logic [31:0] readdataW, aluoutW;
//    logic [31:0] resultW;
//    logic pcsrcD, jumpD;
//    logic [31:0] pcplus4F, pcbranchD;
    logic [27:0] instrDshifted;
//    logic [31:0] pcF;
    
    //fetchStage logics
    logic feclr;
//    logic [31:0] instrD, pcplus4D;
    
    //decodeStage logics
//    logic [31:0] signimmE, rd1E, rd2E;
//    logic [4:0] rdE;
//    logic alusrcE, regdstE;
//    logic [2:0] alucontrolE;
//    logic memwriteE;
//    logic [31:0] aluoutM;
    
    //executeStage logics
//    logic memwriteM;
//    logic [31:0] writedataM;
    
    
    hazunit hazunit(stallF, stallD, flushE,forwardAD, forwardBD,forwardAE, forwardBE,branchD, 
             rsD, rtD, rsE, rtE,
             writeregE, writeregM, writeregW, memtoregE, regwriteE, memtoregM, regwriteM, regwriteW,
             hazreset);
             
    writeStage writeStage(clk, stallF, reset, memtoregW,readdataW, aluoutW,resultW,
                         // pcsrcD,
                           //jumpD,
                            pcplus4F,
                            //pcbranchD,
                            //instrDshifted,
                             pcF);
          
          assign feclr = pcsrcD | jumpD; 
//          logic feclrout;
//          fsm fsm(clk, hazreset, feclr, feclrout);
         
                         
    fetchStage fetchStage( clk, stallD, feclr, pcF, pcplus4D, instrD, pcplus4F,pcsrcD,pcbranchD,
                            reset,
                            jumpD,
                            instrDshifted);
    
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
