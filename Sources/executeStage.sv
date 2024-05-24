`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2023 01:35:54
// Design Name: 
// Module Name: executeStage
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


module executeStage(
input logic clk, regwriteE, memtoregE, memwriteE,
input logic [2:0] alucontrolE,
input logic alusrcE, regdstE, 
input logic [31:0] rd1E, rd2E,
input logic [4:0] rtE, rdE,
input logic [31:0] signimmE,
input logic [31:0] resultW,
input logic [1:0] forwardAE, forwardBE,
output logic [4:0] writeregE,
output logic [4:0] writeregM,
output logic [31:0] writedataM,
output logic [31:0] aluoutM,
output logic memwriteM,
output logic memtoregM,
output logic regwriteM 
    );
    logic [31:0] srcAE, srcBE, writedataE, aluoutE;
    
    
    mux2to1#(5)         mux2to1_E1(regdstE, rtE, rdE, writeregE);
    mux3to1#(32)        mux3to1_E1(forwardAE, rd1E, resultW, aluoutM, srcAE);
    mux3to1#(32)        mux3to1_E2(forwardBE, rd2E, resultW, aluoutM, writedataE);
    mux2to1#(32)        mux2to1_E2(alusrcE, writedataE, signimmE, srcBE);
    alu                 alu(alucontrolE, srcAE, srcBE, aluoutE);
    regExecutetoMemory  regExecutetoMemory(clk, regwriteE, memtoregE, memwriteE,
                                            regwriteM, memtoregM, memwriteM,
                                            aluoutE, writedataE,
                                            aluoutM, writedataM,
                                            writeregE,
                                            writeregM);
                                            
                                            
    
endmodule
