`timescale 1ns / 1ps
//`include "parameters.vh"

module clock(
    input clk,
    output clk_out 
    );
    
reg [27:0] counter = 28'd0;    
parameter DIVISIOR = 28'd10000;

always@(posedge clk)
    begin
        counter <= counter + 28'd1;
        if (counter >= (DIVISIOR - 1)) counter <= 0;       
    end    
       assign clk_out = (counter < DIVISIOR/2) ? 1 : 0;
   // end 
endmodule       
