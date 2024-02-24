`timescale 1ns / 1ps

module testbench;

reg clk = 0;
reg reset_n;
reg change_color;
reg color_intensiv;
reg color_selector;
reg red_LED;
reg green_LED;
reg blue_LED;

top_modul UUT (clk, reset_n, change_color, color_intensiv, color_selector, red_LED, green_LED, blue_LED);
always #5 clk = ~clk;

integer i = 0;

initial
begin
    
        
    #10 $finish; 
      
end

endmodule

