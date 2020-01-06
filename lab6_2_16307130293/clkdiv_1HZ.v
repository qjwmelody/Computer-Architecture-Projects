`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/30 10:59:13
// Design Name: 
// Module Name: clkdiv_1HZ
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


module clkdiv_1HZ(
    input mclk,
    output reg clk
    );
    reg [27:0] count;
    always @(posedge mclk)
    if(count==49999999)
    begin
        clk<=~clk;
        count<=0;
    end
    else
        count<=count+1;
endmodule
