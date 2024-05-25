`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2023 21:08:05
// Design Name: 
// Module Name: regMemorytoWrite
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


module regMemorytoWrite(
input logic clk,
input logic regwriteM, memtoregM,
output logic regwriteW, memtoregW,
input logic [31:0] rdM, aluoutM,
output logic [31:0] rdW, aluoutW,
input logic [4:0] writeregM,
output logic [4:0] writeregW
    );
    
    always_ff@(posedge clk)
    begin
        regwriteW<=regwriteM;
        memtoregW<=memtoregM;
        rdW<=rdM;
        aluoutW<=aluoutM;
        writeregW<=writeregM;
    end
endmodule
