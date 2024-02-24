`timescale 1ns / 1ps
module dff(
    input id,
    input iclk,
    input rst,
    output reg oq
    );
 
always @ (posedge iclk, posedge rst)
    begin
    if (rst == 1)
        oq <= 1'b0;
    else
        oq <= id;    
    end
 
endmodule
