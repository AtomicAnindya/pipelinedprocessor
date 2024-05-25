`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2023 23:58:52
// Design Name: 
// Module Name: alu
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


module alu(
input logic [2:0] select,
input logic [31:0] a,b,
output logic [31:0] y
    );
    //logic [31:0] y;
    always_comb
    begin
    case(select)
        3'b000:  y = a&b;
        3'b001:  y = a|b;
        3'b010:  y = a+b;
    //    3'b011: 
    //    3'b100:
    //    3'b101:
        3'b110:  y = a-b;
        3'b111:  y = (a<b)? 1:0;
        default: y=32'bx;
    endcase
    end

    //assign out= y;
endmodule
