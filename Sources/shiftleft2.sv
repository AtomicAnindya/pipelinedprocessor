`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2023 22:10:33
// Design Name: 
// Module Name: shiftleft2
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


module shiftleft2(
input logic [31:0] a,
output logic [31:0] y
    );
    
    assign y = {a[29:0], 2'b00};
endmodule
