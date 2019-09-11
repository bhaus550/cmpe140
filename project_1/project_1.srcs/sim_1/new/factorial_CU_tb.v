`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2019 07:05:32 AM
// Design Name: 
// Module Name: factorial_CU_tb
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


module factorial_CU_tb();


reg clk_tb, go_tb;

reg GT_tb, GT_CS_tb; 
wire sel_tb, load_reg_tb, load_cnt_tb, OE_tb, en_tb, done_tb, error_tb;

factorial_CU DUT (
    .go(go_tb), 
    .clk(clk_tb), 
    .GT(GT_tb), 
    .GT_CS(GT_CS_tb),
    .Sel(sel_tb), 
    .Load_reg(load_reg_tb), 
    .Load_cnt(load_cnt_tb), 
    .OE(OE_tb), 
    .En(en_tb),
    .Done(done_tb), 
    .Error(error_tb)
);

task tick;
    begin  
        clk_tb <= 1;
        #5;
        clk_tb <= 0;
        #5;
    end 
endtask


initial
begin
$display("Test Start");

go_tb         = 1'b1;
GT_tb    = 1'b0;
GT_CS_tb   = 1'b0;


    tick;
    tick;
    tick;
    tick;
    tick;
    GT_CS_tb = 1'b1;
    tick;
    tick;
    tick;
    tick;

$display("Test Complete");
$finish;
end

endmodule
