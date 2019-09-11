`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2019 10:15:03 AM
// Design Name: 
// Module Name: factorial_top
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


module factorial_dp(
    input wire [3:0] n,
    input wire sel,
    input wire en,
    input wire clk,
    input load_cnt,
    input load_reg,
    input wire OE,
    output wire[31:0] out,
    output wire done,
    output wire GT_CS,
    output wire GT
    );
    wire [31:0] regout;
    wire [31:0] mux_out;
    wire [31:0] z;
    wire [3:0] Q;
    
    mux #(.WIDTH(32)) 
        mux1 (
        .sel    (sel),
        .in0    (z),
        .in1    (1),   
        .out    (mux_out)
    );
    buffer output_bufer(
        .in     (regout),
        .OE     (OE),
        .out    (out)
       // .done   (done)
        );
    
    reg_file register_file(
        .clk    (clk),
        .ld_reg (load_reg),
        .din    (mux_out),
        .reg_out    (regout)
    );
    
    multiply mult_fact (
        .in1    (Q),
        .in2    (regout),
        .out    (z)
    );
    
    compare gt_error (
        .A  (n),
        .B  (4'b1100),
        .GT (GT_CS)
    );
    compare gt_one (
        .A  (Q),
        .B  (4'b0001),
        .GT (GT)
    );
    down_counter count(
        .n  (n),
        .en (en),
        .load_cnt   (load_cnt),
        .clk    (clk),
        .Q  (Q)
    );
endmodule
