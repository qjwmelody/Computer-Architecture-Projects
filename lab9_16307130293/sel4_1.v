`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/08 22:09:39
// Design Name: 
// Module Name: sel4_1
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


module sel4_1(
    input [1:0] sel,
    input [3:0] a,
    input [3:0] b,
    input [3:0] c,
    input [3:0] d,
    output reg [3:0] y
    );
    always @(sel,a,b,c,d)
    begin
        case(sel)
            2'b00:y=a;
            2'b01:y=b;
            2'b10:y=c;
            2'b11:y=d;
            default:y=4'bx;
        endcase
    end
endmodule
