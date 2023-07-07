`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2023 00:56:07
// Design Name: 
// Module Name: memoryStage
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


module memoryStage(
input logic clk,
input logic regwriteM, memtoregM, memwriteM,
input logic [31:0] aluoutM,writedataM,
input logic [4:0] writeregM,
output logic regwriteW, memtoregW,
output logic [31:0] readdataW, aluoutW,
output logic [4:0] writeregW
    );
    logic [31:0] rd;
    
    dmem dmem(clk, memwriteM,  aluoutM, writedataM, rd);
    regMemorytoWrite regMemorytoWrite(clk, regwriteM, memtoregM, regwriteW, memtoregW,
                                        rd, aluoutM, readdataW, aluoutW, writeregM, writeregW);
endmodule
