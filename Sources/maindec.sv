`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2023 01:27:29
// Design Name: 
// Module Name: maindec
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


module maindec(
input logic [5:0] op,
output logic memtoregD, memwriteD, branchD, alusrcD, regdstD, regwriteD, jumpD,
output logic [1:0] aluop
    );
    
    logic [8:0] controls;
    
    assign {regwriteD, regdstD, alusrcD, branchD, memwriteD, memtoregD, jumpD, aluop}=controls;
    
    always_comb
        case(op)
            6'b000000 : controls=9'b1100_00010;
            6'b100011 : controls=9'b1010_01000;
            6'b101011 : controls=9'b0010_10000;
            6'b000100 : controls=9'b0001_00001;
            6'b001000 : controls=9'b1010_00000;
            6'b000010 : controls=9'b0000_00100; 
            default : controls=9'bxxxx_xxxxx;      
        endcase
    
endmodule

