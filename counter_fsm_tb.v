`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 01:35:20 PM
// Design Name: 
// Module Name: le9_tb
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

module test;
  reg clk,reset;
  
   wire [7:0] ones_cnt;
   wire ones_pulse;
   wire [7:0] tens_cnt;
   wire tens_pulse; 
  reg [7:0] ones_extra;

  always @(*) begin
    if (tens_cnt == 8'd5)
      ones_extra = 8'd4;
    else 
      ones_extra = 8'd9;
  end
  // Instantiate design under test
  state_cntr U1(
    .en(1'b1), .clk(clk), .reset(reset), .terminal(ones_extra), .cnt(ones_cnt), .pulse(ones_pulse));
  
  state_cntr U2(
    .en(ones_pulse), .clk(clk), .reset(reset), .terminal(8'd5), .cnt(tens_cnt), .pulse(tens_pulse) );  
    initial begin
    clk = 0;
    reset = 0;
    #2
    reset = 1;
    #2 
    reset = 0;
 
    #800
    $finish;
    
    
  end
  
  always begin
    #10
    clk = ~clk;
  end
  
endmodule
closes #1
