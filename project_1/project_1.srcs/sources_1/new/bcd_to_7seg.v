`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2019 06:18:53 AM
// Design Name: 
// Module Name: bcd_to_7seg
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


module bcd_to_7seg (
        input  wire [3:0] BCD,
        output reg  [7:0] s
    );

    always @ (BCD) begin
        case (BCD)
                4'd0: s = 8'b11000000;
                4'd1: s = 8'b11111001;
                4'd2: s = 8'b10100100;
                4'd3: s = 8'b10110000;
                4'd4: s = 8'b10011001;
                4'd5: s = 8'b10010010;
                4'd6: s = 8'b10000010;
                4'd7: s = 8'b11111000;
                4'd8: s = 8'b10000000;
                4'd9: s = 8'b10010000;
                4'd10: s = 8'b11001000;
                4'b11: s = 8'b00000000;
                4'd12: s = 8'b11000110;
                4'd13: s = 8'b01000000;
                4'd14: s = 8'b10111001;
                4'd15: s = 8'b10001110;
             default: s = 8'b01111111;
        endcase
    end

endmodule
