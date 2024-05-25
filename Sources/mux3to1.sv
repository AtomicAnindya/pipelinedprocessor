`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2023 01:49:00
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
    
//    always_comb
//        case(select)
//            2'b00: y=d0;
//            2'b01: y=d1;
//            2'b10: y=d2;
          
//        endcase
endmodule
