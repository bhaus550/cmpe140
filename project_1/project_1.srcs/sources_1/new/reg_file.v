`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2019 10:21:06 AM
// Design Name: 
// Module Name: reg_file
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


module reg_file(
    input wire clk,
    input wire ld_reg,
    input wire [31:0] din,
    output reg [31:0] reg_out
    );
    
    
    always @ (posedge clk) begin
        if(ld_reg) begin
            reg_out <= din;
        end
    end

endmodule
