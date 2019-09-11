`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2019 11:44:23 AM
// Design Name: 
// Module Name: cu_dp_tb
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


module cu_dp_tb();
    reg tb_go, tb_clk;
    reg [3:0] tb_n;
    wire tb_done, tb_error;
    wire[7:0] tb_out;
    
 factorial_cu_dp DUT(
    .go (tb_go),
    .clk (tb_clk),
    .n   (tb_n),
    .done   (tb_done),
    .error  (tb_error),
    .out    (tb_out)
    );
    
task tick;
    begin
        tb_clk <=1;
        #5;
        tb_clk <=0;
        #5;
    end
endtask
integer i;
initial 
begin
    tb_go =1;
    for(i =1; i<14;i=i+1) begin
        assign tb_n = i;
        tick;
        while(tb_done != 1) begin
            tick;
        end
        tick;
    end
end

endmodule
