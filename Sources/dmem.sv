`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2024 09:31:50
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
    
    logic [31:0] RAM [2**10-1:0]; //using 32-bit word and 32-bit address RAM
 
    
    always@(negedge clk)
    begin
    if(we) RAM[a]<=wd;
    end

assign  rd = RAM[a];
endmodule
