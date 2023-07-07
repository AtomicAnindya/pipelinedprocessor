`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2023 01:24:11
// Design Name: 
// Module Name: regDecodetoExecute
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


module regDecodetoExecute(
input logic clk, clr,
input logic regwriteD,memtoregD,memwriteD, alusrcD, regdstD,
output logic regwriteE, memtoregE, memwriteE, alusrcE, regdstE,
input logic [2:0] alucontrolD,
output logic [2:0] aluconrolE,
input logic [31:0] rd1D, rd2D, 
output logic [31:0] rd1E, rd2E, 
input logic [4:0] rsD,rtD,rdD,
output logic [4:0] rsE,rtE,rdE,
input logic [31:0] signimmD,
output logic [31:0] signimmE
    );
    
    always_ff@(posedge clk)
    begin
        if(clr)
        begin
            regwriteE<=0;
            memtoregE<=0; 
            memwriteE<=0; 
            alusrcE<=0; 
            regdstE<=0;
            aluconrolE<=0;
            rd1E<=0;
            rd2E<=0;
            rsE<=0;
            rtE<=0;
            rdE<=0;
            signimmE<=0;
        end
        else
        begin
            regwriteE<=regwriteD;
            memtoregE<=memtoregD; 
            memwriteE<=memwriteD; 
            alusrcE<=alusrcD; 
            regdstE<=regdstD;
            aluconrolE<=alucontrolD;
            rd1E<=rd1D;
            rd2E<=rd2D;
            rsE<=rsD;
            rtE<=rtD;
            rdE<=rdD;
            signimmE<=signimmD; 
        end
    end
endmodule
