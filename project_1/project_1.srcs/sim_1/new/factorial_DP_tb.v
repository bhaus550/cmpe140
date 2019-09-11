`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2019 09:02:35 AM
// Design Name: 
// Module Name: factorial_DP_tb
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


module factorial_DP_tb();

reg  tb_sel, tb_en, tb_clk, tb_load_cnt, tb_load_reg, tb_OE; 
reg [3:0]  tb_n;
wire [3:0] tb_out;
wire tb_done, tb_GT_CS, tb_GT;

factorial_dp DUT (
    .n          (tb_n),
    .sel        (tb_sel),
    .en         (tb_en),
    .clk        (tb_clk),
    .load_cnt   (tb_load_cnt),
    .load_reg   (tb_load_reg),
    .OE         (tb_OE),
    .out        (tb_out),
    .done       (tb_done),
    .GT_CS      (tb_GT_CS),
    .GT         (tb_GT)
);

task tick;
    begin
        tb_clk <=1;
        #5;
        tb_clk <=0;
        #5;
    end
endtask
reg x =1;
initial 
begin
$display("DP Testing");
    //state 0
    for( tb_n = 1; tb_n<13; tb_n=1+1) begin
    //state 1
        tb_sel = 1;
        tb_load_reg =1;
        tb_load_cnt =1;
        tb_en =1;
        tick;
        for(x = tb_n; x>0; x = x-1) begin
        //state 2
            tick; 
            //state 3 
            if(x ==1) begin
               if(tb_out != 1) begin
                   $display("Error at tb_n =1"); 
               end               
            end 
            else
                tb_sel = 0;     
            tick;
            //state 4 
            //for loop down counts            
        end   
    end   
    $finish;
end
endmodule
