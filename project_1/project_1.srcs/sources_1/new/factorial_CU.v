`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2019 10:37:42 AM
// Design Name: 
// Module Name: factorial_CU
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


module factorial_CU(
    input go, clk,
    input GT, GT_CS,
    output reg Sel, Load_reg, Load_cnt, OE, En,
    output Done, Error
    );
    
    //Next and Current State Registers
    reg [2:0] CS = 0, NS;
    reg Error_Internal = 0, Done_Internal = 0;
    
    assign Error = GT_CS;
    assign Done = Done_Internal;

    //States
    parameter Idle             = 3'd0,
              Load             = 3'd1,
              Wait             = 3'd2,
              OE_AND_Done      = 3'd3,
              Mult_AND_Dec     = 3'd4;
    

    
    //Next State Logic
    always @ (CS, go, GT)
    begin
        case (CS)
            Idle:
            case({go,GT_CS})
                2'b11:  {NS,Error_Internal} <= {Idle,1'b1};
                2'b10:  {NS,Error_Internal} <= {Load,1'b0};
                2'b0?:  {NS,Error_Internal} <= {Idle,1'b0};
                default: NS = Idle; 
            endcase
            Load:          NS <= Wait;
            //Wait2:                     NS <= Wait;
            Wait:                      NS <= GT ? Mult_AND_Dec : OE_AND_Done;
            OE_AND_Done:               NS <= Idle;
            Mult_AND_Dec:              NS <= Wait;
        endcase
    end
    
    //State Register
    always @ (posedge clk)
        CS = NS;
    
    //Output Logic
    always @ (CS)
    begin
        case (CS)
            //S0
            Idle: 
            begin
                {Sel, Load_cnt, En, Load_reg, OE, Done_Internal} <= 6'b1_0_0_0_0_0;
            end 
            //S1
            Load:
            begin
                {Sel, Load_cnt, En, Load_reg, OE, Done_Internal} <= 6'b1_1_1_1_0_0;
            end
            //S2
            Wait:
            begin
                {Sel, Load_cnt, En, Load_reg, OE, Done_Internal} <= 6'b0_0_0_0_0_0;
            end
            //S3
            OE_AND_Done:
            begin
                {Sel, Load_cnt, En, Load_reg, OE, Done_Internal} <= 6'b0_0_0_0_1_1;
            end
            //S4
            Mult_AND_Dec: 
            begin
                {Sel, Load_cnt, En, Load_reg, OE, Done_Internal} <= 6'b0_0_1_1_0_0;
            end
        endcase         
    end
endmodule
