`timescale 1ns / 1ps
`include "parameters.vh"

module rgb_delit(
    input wire clk,
    input wire reset_n,
    input [R:0] red_duty, green_duty, blue_duty,
    output red_LED, green_LED, blue_LED
    );

 
pwm_d Red(
    .clk(clk),
    .duty(red_duty),
    .pwm_out(red_LED)
); 


pwm_d Green(
    .clk(clk),
    .duty(green_duty),
    .pwm_out(green_LED)
); 
 

pwm_d Blue(
    .clk(clk),
    .duty(blue_duty),
    .pwm_out(blue_LED)
);  
       
endmodule