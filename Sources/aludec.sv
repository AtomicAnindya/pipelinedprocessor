`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2023 23:18:11
// Design Name: 
// Module Name: aludec
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


module aludec(
input logic [5:0]funct,
input logic [1:0]aluop,
output logic [2:0] alucontrolD
    );
    
    always_comb
        case(aluop)
            2'b00:alucontrolD=3'b010;
            2'b01:alucontrolD=3'b110;
            default: case(funct)
                    6'b1000_00: alucontrolD=3'b010;
                    6'b1000_10: alucontrolD=3'b110;
                    6'b1001_00: alucontrolD=3'b000;
                    6'b1001_01: alucontrolD=3'b001;
                    6'b1010_10: alucontrolD=3'b111;
                    default:    alucontrolD=3'bxxx;
                endcase
        endcase
endmodule
