`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2023 20:35:58
// Design Name: 
// Module Name: fsm
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


module fsm(
input logic clk, hazreset,
input logic in,
output logic out
    );
    typedef enum  logic[1:0] {s0,s1,s2} statetype;
    statetype state, nextstate;
    
    always_ff@(posedge clk, posedge hazreset)
        if(hazreset)    state<=s0;
        else            state<=nextstate;
        
        
   always_comb
        case(state)
            s0: if(in)  nextstate=s1;
                else    nextstate=s0;
            s1: if(in)  nextstate=s1;
                else    nextstate=s0;
//            s2: nextstate=s0;
        endcase
        
        assign out =(state!=s0);
endmodule
