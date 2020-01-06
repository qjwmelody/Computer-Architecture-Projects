`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/27 23:39:12
// Design Name: 
// Module Name: Clock
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


module Clock(
    input mclk,
    input RESET,
    input load1,
    input load2,
    output reg [6:0]out,
    output reg [7:0]AN,
    output [7:0]min,
    output [7:0]hour
);
wire clk;
clkdiv_1HZ d(mclk,clk);

wire couts,coutm; 
reg [27:0] q;
reg [1:0] s;
reg [3:0] digit;

counter60(min,couts,8'b00110001,load1,1'b1,RESET,clk);
counter24(hour,coutm,8'b00100011,load2,1'b1,RESET,couts);

always@(posedge mclk)
    q<=q+1;
always@(*)
begin
    AN=8'b11111111;
    s<=q[14:13];
    AN[s]=0;
    case(s)
        2'b00:digit<=min[3:0];
        2'b01:digit<=min[7:4];
        2'b10:digit<= hour[3:0];
        2'b11:digit<= hour[7:4];
     endcase
     case(digit)
                4'b0000:out[6:0]=7'b0000001;
                4'b0001:out[6:0]=7'b1001111;
                4'b0010:out[6:0]=7'b0010010;
                4'b0011:out[6:0]=7'b0000110;
                4'b0100:out[6:0]=7'b1001100;
                4'b0101:out[6:0]=7'b0100100;
                4'b0110:out[6:0]=7'b0100000;
                4'b0111:out[6:0]=7'b0001111;
                4'b1000:out[6:0]=7'b0000000;
                4'b1001:out[6:0]=7'b0001100;
                default:out[6:0]=7'bxxxxxxx;
     endcase
end
endmodule
