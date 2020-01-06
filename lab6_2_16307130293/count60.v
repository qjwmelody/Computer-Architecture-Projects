`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/28 00:31:31
// Design Name: 
// Module Name: count60
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


module counter60(
    output reg [7:0] qout,
    output cout,
    input [7:0] data,
    input load,
    input cin,
    input reset,
    input clk
    );
    always@(posedge clk)
    begin
        if(reset) qout<=0;
        else if(load) qout<=data;
        else if(cin)
              begin
                if(qout[3:0]==9)//µÍÎ»
                begin
                    qout[3:0]<=0;
                    if(qout[7:4]==5)//¸ßÎ»
                        qout[7:4]<=0;
                    else qout[7:4]<=qout[7:4]+1; 
                end
                else 
                    qout[3:0]<=qout[3:0]+1;
              end
    end
    assign cout=((qout==8'h00)&cin)? 1:0;
endmodule
