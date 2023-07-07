`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2023 01:09:53
// Design Name: 
// Module Name: regfile
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


module regfile(
input logic clk, wrenable,
input logic [4:0] a1, a2, a3,
output logic [31:0] rd1, rd2,
input logic [31:0] wd3
    );
    logic [31:0] RAM [31:0]; //log128/log2 bit address, each address contains 
                             //32bit data
                             //128 addresses
    always_ff@(negedge clk)
    begin
    if(wrenable)RAM[a3]<=wd3;
    end
    
    assign rd1=(a1!=0)? RAM[a1]:0;
    assign rd2=(a2!=0)? RAM[a2]:0;

endmodule
