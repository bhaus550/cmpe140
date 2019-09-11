`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2019 03:31:50 PM
// Design Name: 
// Module Name: down_counter
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


module down_counter(
    input wire [3:0] n,
    output reg [3:0] Q,
    input wire en,
    input wire load_cnt,
    input wire clk
    );
    reg in[3:0];

    always @ (posedge clk) begin
        if (en) begin
            if(load_cnt) begin
                Q <= n;
            end
            else
                Q <= Q-1;
        end
        else
            Q <= Q;
    end
endmodule
