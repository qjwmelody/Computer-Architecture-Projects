`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/08 22:14:59
// Design Name: 
// Module Name: sel2_1
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


module sel2_1(
    input sel,
    input [3:0] a,
    input [3:0] b,
    output reg [3:0] y
    );
    always @(sel,a,b)
    begin
        if(sel==1)
            y=a;
        else
            y=b;
    end
endmodule
