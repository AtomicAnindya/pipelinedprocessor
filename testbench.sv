`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2023 00:44:42
// Design Name: 
// Module Name: testbench
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


module testbench();

    logic clk, reset;
    logic memwriteM;
    logic [31:0] writedataM;
    logic [31:0] aluoutM;
    logic hazreset;
     
    mips uut(.clk(clk),.reset(reset),.hazreset(hazreset),
                                   .memwriteM(memwriteM),
                .writedataM(writedataM),.aluoutM(aluoutM));
    
    always
    begin
    clk<=1; #5;
    clk<=0; #5;
    end
    
    initial
    begin
    reset<=1; hazreset<=1;
    
    #12; reset<=0;
    #1; hazreset<=0;
    
    end
endmodule
