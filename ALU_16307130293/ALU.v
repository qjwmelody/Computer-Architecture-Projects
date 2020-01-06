`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/17 22:41:32
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    input [1:0] S,
    input M,
    output reg [3:0] F,
    output reg Cn
    );
//    reg [4:0] temp;
//    function [4:0] adder;
//        input [3:0] a;
//        input [3:0] b;
//        input ci;
//        reg [3:0] c;
//        reg [3:0] g;
//        reg [3:0] p;
//        reg cn;
//        begin
//        g=a&b;
//        p=a^b;
//        c[0]=ci;
//        c[1]=g[0]|p[0]&c[0];
//        c[2]=g[1]|p[1]&g[0]|p[1]&p[0]&c[0];
//        c[3]=g[2]|p[2]&g[1]|p[2]&p[1]&g[0]|p[2]&p[1]&p[0]&c[0];
//        cn=g[3]|p[3]&g[2]|p[3]&p[2]&g[1]|p[3]&p[2]&p[1]&g[0]|p[3]&p[2]&p[1]&p[0]&c[0];
//        adder={cn,p^c};
//        end
//    endfunction
    always @(A,B,Cin,M,S)
    begin
        if(~M)
           begin 
                Cn=1'b0;
                case(S)
                    2'b00:F=~A;
                    2'b01:F=A&B;
                    2'b10:F=A|B;
                    2'b11:F=A^B;
                endcase
            end
        else
            if(S==2'b00)
            begin
            if(Cin==0)
               {Cn,F}=A+B;
            else
               {Cn,F}=A+B+1;
            end
            else if(S==2'b01)
            begin
            if(Cin==0)
               {Cn,F}=A-B;
            else
               {Cn,F}=A-B-1;
            end
            else
               {Cn,F}=5'b00000;
    end
endmodule
