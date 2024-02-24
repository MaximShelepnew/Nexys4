`timescale 1ns / 1ps

module distance_calc(
    input wire clk,
    input wire [20:0] distance,
    output reg [6:0] cathode,
    output reg [7:0] anode
    );
    
always@(posedge clk)
begin
    anode = 8'b11111110;
     case (distance % 10)                   
         0: cathode = 7'b1000000;//сегменты 
         1: cathode = 7'b1111001;           
         2: cathode = 7'b0100100;           
         3: cathode = 7'b0110000;           
         4: cathode = 7'b0011001;           
         5: cathode = 7'b0010010;           
         6: cathode = 7'b0000010;           
         7: cathode = 7'b1111000;           
         8: cathode = 7'b0000000;           
         9: cathode = 7'b0010000;           
         default cathode = 7'b1000000;      
     endcase                                
end
    
endmodule
