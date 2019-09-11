`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2019 10:08:15 PM
// Design Name: 
// Module Name: buffer
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


module buffer(
    input wire [31:0] in,
    input wire OE,
    output wire [31:0] out
    //output wire done
    );
    //assign done = (OE != 0) ? 1 : 0;
    assign out = (OE != 0) ? in : 0;
endmodule
