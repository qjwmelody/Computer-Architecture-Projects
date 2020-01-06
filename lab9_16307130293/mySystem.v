`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/08 21:47:35
// Design Name: 
// Module Name: mySystem
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


module mySystem(
    input CLK100MHZ,
    input [14:0] SW,
    input RESET,
    output reg [15:0] LED
    );
    wire clk1_4hz;
    clkdiv U0(CLK100MHZ,clk1_4hz);
    wire [3:0] y2o,yout,q1,q2,q3,q4;
    
    always @(posedge clk1_4hz)
    begin
        if(RESET)
            LED=16'b0000_0000_0000_0000;
        else 
        begin
            LED[3:0]=q2;
            LED[7:4]=q3;
            LED[11:8]=q1;
            LED[15:12]=q4;
        end
    end
    

    reg377 U1(clk1_4hz,SW[7],y2o,q1);
    reg377 U2(clk1_4hz,SW[6],yout,q2);
    reg377 U3(clk1_4hz,SW[5],yout,q3);
    
    ram2 U4(clk1_4hz,SW[0],SW[4:1],yout,q4);
    
    sel2_1 U5(SW[12],SW[11:8],yout,y2o);
    sel4_1 U6(SW[14:13],q1,q2,q3,q4,yout);
  
endmodule
