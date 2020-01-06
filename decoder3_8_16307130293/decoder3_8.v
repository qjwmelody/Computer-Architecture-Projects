`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/30 08:52:10
// Design Name: 
// Module Name: decoder3_8
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


module decoder3_8(
    output reg [7:0] out,
    input [2:0] in,
    input g1,
    input g2a,
    input g2b
    );
    always @(in,out,g1,g2a,g2b)
    begin 
       if(g1&~g2a&~g2b)
          begin case(in)
          3'b000:out=8'b0111_1111;
          3'b001:out=8'b1011_1111;
          3'b010:out=8'b1101_1111;
          3'b011:out=8'b1110_1111;
          3'b100:out=8'b1111_0111;
          3'b101:out=8'b1111_1011;
          3'b110:out=8'b1111_1101;
          3'b111:out=8'b1111_1110;   
          endcase
          end
       else out=8'b1111_1111;
    end 
endmodule
