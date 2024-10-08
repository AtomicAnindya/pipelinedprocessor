`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2023 15:02:35
// Design Name: 
// Module Name: imem
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


module imem(
input logic [31:0] a,
output logic [31:0] rd
    );
    logic [31:0] RAM[1023:0];
    initial
    begin
        $readmemh("memfile.mem", RAM);
    end
    
    assign rd= RAM[a[9:0]];
endmodule
