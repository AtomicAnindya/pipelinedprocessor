`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2023 20:36:23
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
                forwardAE=2'b10;
            else if((rsE!=0)&(rsE==writeregW)& regwriteW)
                forwardAE=2'b01;
            else
                forwardAE=2'b00;
                //////////////////////////
            if((rtE!=0)&(rtE==writeregM)& regwriteM)
                forwardBE=2'b10;
            else if((rtE!=0)&(rtE==writeregW)& regwriteW)
                forwardBE=2'b01;
            else
                forwardBE=2'b00;
        end
        
//    always_comb
//               begin

//               end
                
       assign forwardAD = (rsD != 0) & (rsD==writeregM) & regwriteM; 
       assign forwardBD = (rtD != 0) & (rtD==writeregM) & regwriteM; 
       assign lwstall= ((rsD==rtE)|(rtD==rtE))& memtoregE ;
       
       assign branchstall = (branchD & regwriteE & ((writeregE == rsD)|(writeregE == rtD)))|
                             (branchD & memtoregM & ((writeregM == rsD)|(writeregM == rtD)));
                             
       assign flushE = (hazreset)?0:(lwstall | branchstall);
       assign stallD = (hazreset)?0:(lwstall | branchstall);
       assign stallF = (hazreset)?0:(lwstall | branchstall);
        
endmodule
