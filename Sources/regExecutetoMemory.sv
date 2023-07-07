`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2023 01:20:10
// Design Name: 
// Module Name: regExecutetoMemory
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


module regExecutetoMemory(
input logic clk,
input logic regwriteE, memtoregE, memwriteE,
output logic regwriteM, memtoregM, memwriteM,
input logic [31:0] aluoutE, writedataE,
output logic [31:0] aluoutM, writedataM,
input logic [4:0] writeregE,
output logic [4:0] writeregM
    );
    
    always_ff@(posedge clk)
    begin
        regwriteM<=regwriteE;
        memtoregM<=memtoregE;
        memwriteM<=memwriteE;
        aluoutM<=aluoutE;
        writedataM<=writedataE;
        writeregM<=writeregE;
    end
endmodule
