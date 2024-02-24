`timescale 1ns / 1ps
`include "parameters.vh"

module pwm_d(
    input clk,
    input [R:0] duty,
    output pwm_out 
    );
    
reg [R:0] counter = 0;    
//parameter DIVISIOR = 28'd10000;

always@(posedge clk)
   // begin
        counter <= counter + 1;
       // if (counter >= (duty - 1)) counter <= 0;       
    // end   
       assign pwm_out = (duty > counter) ? 1 : 0;
         
endmodule
