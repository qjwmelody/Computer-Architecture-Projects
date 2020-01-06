`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/04 08:39:19
// Design Name: 
// Module Name: count24
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


module counter24(        
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
                        if(qout[3:0]==3)//µÍÎ»
                        begin
                            if(qout[7:4]==2)//¸ßÎ»
                            begin
                                qout[7:4]<=0; 
                                qout[3:0]<=0;
                            else
                                qout[7:4]<=qout[7:4]+1; 
                        end
                        else 
                            qout[3:0]<=qout[3:0]+1;
                   end
        end
        assign cout=((qout==8'h23)&cin)? 1:0;
    endmodule


