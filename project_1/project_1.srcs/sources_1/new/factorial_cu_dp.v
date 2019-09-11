`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2019 08:23:12 AM
// Design Name: 
// Module Name: factorial_cu_dp
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


module factorial_cu_dp(
    input wire go,
    input wire clk,
    input wire [3:0] n, 
    output wire done, error,
    output wire [31:0] out
    );
    
    wire sel;
    wire en;
    wire load_reg;
    wire load_cnt;
    wire OE;
    wire GT;
    wire GT_CS;
    factorial_dp fact_dp (
        .n          (n),
        .sel        (sel),
        .en         (en),
        .clk        (clk),
        .load_cnt   (load_cnt),
        .load_reg   (load_reg),
        .OE         (OE),
        .out        (out),
      //  .done       (done),
        .GT_CS      (GT_CS),
        .GT         (GT)
    );
    
    factorial_CU fact_cu(
        .go(go),
        .clk(clk),
        .GT(GT),
        .GT_CS(GT_CS),
        .Sel(sel),
        .Load_reg(load_reg),
        .Load_cnt(load_cnt),
        .OE(OE),
        .En(en),
        .Done(done),
        .Error(error)    
    );
    
endmodule
