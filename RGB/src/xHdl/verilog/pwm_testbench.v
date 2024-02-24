`timescale 1ns / 1ps
`include "parameters.vh"

module pwm_testbench;

reg clk;
reg [8:0] duty = 0;
wire [8:0] pwm_out;

pwm_d UUT(clk, duty, pwm_out);
always #5 clk = ~clk;

integer i = 0;

initial
begin
    
    for (i=0;i<=510;i=i+1)
    begin
    #1000 duty=i;
    end   
    #10 $finish; 
      
end


endmodule
