`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2023 00:58:46
// Design Name: 
// Module Name: dmem
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


module dmem(
input logic clk,we,
input logic [31:0] a, 
input logic [31:0] wd,
output logic [31:0] rd
    );
    
    logic [31:0] RAM [4294967295:0]; //using 32-bit word and 32-bit address RAM
 
    
    always@(negedge clk)
    begin
    if(we) RAM[a]<=wd;
    end

assign  rd = RAM[a];
endmodule