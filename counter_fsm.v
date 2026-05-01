`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 01:35:37 PM
// Design Name: 
// Module Name: le9
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

module state_cntr(
    input en,
    input clk,
    input reset,
    input  [7:0] terminal,   
    output [7:0] cnt, 
    output pulse
    );

reg [7:0] cnt_reg;
reg [7:0] next_cnt;
 
assign cnt   = cnt_reg;                    

// flip-flops (state memeory)
always @(posedge clk or posedge reset) begin
    if (reset==1'b1) cnt_reg<=8'd0; // reset to zero 
    else cnt_reg <= next_cnt;
end

// next-state logic 
always @(*) begin
    if(en) begin // check for the enable 
        if (cnt_reg == terminal) next_cnt = 0; // if the counter reaches 15 go back to zero 
        else next_cnt = cnt_reg + 1; // new concept -- a counter! 
    end 
    else next_cnt = cnt_reg; // if enable is low stay in the same state 
end

// output logic 
 
assign pulse = (cnt_reg == terminal);// at the last state send out a pulse
endmodule
