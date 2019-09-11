`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2019 01:54:40 PM
// Design Name: 
// Module Name: clk_gen
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
module clk_gen(
    input wire clk100MHz,
    input wire rst,
    output reg clk_4sec,
    output reg clk_5KHz
    );
    
    integer count1, count2;
    
    always@(posedge clk100MHz)
    begin
        if (rst)
        begin
            count1 = 0; clk_4sec = 0;
            count2 = 0; clk_5KHz = 0;
        end
        else
        begin
            if (count1 == 200000000)
            begin
                clk_4sec = ~clk_4sec;
                count1 = 0;
            end
            
            if (count2 == 10000)
            begin
                clk_5KHz = ~clk_5KHz;
                count2 = 0;
            end
            count1 = count1 + 1;
            count2 = count2 + 1;
        end
    end
endmodule

