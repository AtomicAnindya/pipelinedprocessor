`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2023 00:56:34
// Design Name: 
// Module Name: hazunit
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


module hazunit(
output logic stallF, stallD, flushE,
output logic forwardAD, forwardBD,
output logic [1:0] forwardAE, forwardBE,
input logic branchD, 
input logic [4:0] rsD, rtD, rsE, rtE,
input logic [4:0] writeregE, writeregM, writeregW,
input logic memtoregE, regwriteE, memtoregM, regwriteM, regwriteW,
input logic hazreset
    );
    logic lwstall, branchstall;
    always_comb
        begin
            if((rsE!=0)&(rsE==writeregM)& regwriteM)
                forwardAE=10;
            else if((rsE!=0)&(rsE==writeregW)& regwriteW)
                forwardAE=01;
            else
                forwardAE=00;
        end
        
    always_comb
               begin
                    if((rtE!=0)&(rtE==writeregM)& regwriteM)
                        forwardBE=10;
                    else if((rtE!=0)&(rtE==writeregW)& regwriteW)
                        forwardBE=01;
                    else
                        forwardBE=00;
               end
                
       assign forwardAD = (rsD != 0) & (rsD==writeregM) & regwriteM; 
       assign forwardBD = (rtD != 0) & (rtD==writeregM) & regwriteM; 
       assign lwstall= ((rsD==rtE)|(rtD==rtE))& memtoregE ;
       
       assign branchstall = (branchD & regwriteE & ((writeregE == rsD)|(writeregE == rtD)))|
                             (branchD & regwriteM & ((writeregM == rsD)|(writeregM == rtD)));
                             
       assign flushE = (hazreset)?0:(lwstall | branchstall);
       assign stallD = (hazreset)?0:(lwstall | branchstall);
       assign stallF = (hazreset)?0:(lwstall | branchstall);
        
endmodule

