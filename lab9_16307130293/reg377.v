`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/08 22:03:19
// Design Name: 
// Module Name: reg377
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


module reg377(
    input clk,
    input en,
    input [3:0] d,
    output reg [3:0] q
    );
    always @(posedge clk)
    begin
        if(en==0)
            q<=q;
        else
            q<=d;
    end
endmodule
