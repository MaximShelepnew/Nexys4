`timescale 1ns / 1ps

module refreshcounter(//counting the number of digits of a number, each clock cycle is a new digit
    input refresh_clock,
    output reg [1:0] refreshcounter = 0
    );
    
always@(posedge refresh_clock) 
 refreshcounter <= refreshcounter + 1;
endmodule
