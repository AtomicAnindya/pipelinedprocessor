`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2023 01:16:46
// Design Name: 
// Module Name: mux3to1
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


module mux3to1#(parameter width=32)(
input logic [1:0] select,
input logic [width-1:0] d0,d1,d2,
output logic [width-1:0] y
    );
    
    
    assign y = (select[1]==0)?((select[0]==0)?d0:d1):((select[0]==0)?d2:32'bx);
    

endmodule
