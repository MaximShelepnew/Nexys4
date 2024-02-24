`timescale 1ns / 1ps
`include "parameters.vh"

`timescale 1ns / 1ps
`include "parameters.vh"


module top_modul(
    input wire clk,
    input wire reset_n,
    input wire ROT_A,//JB1 - G14
    input wire ROT_B,//JB2 - P15
    input wire btn,//JB3 - V11
    output wire [7:0] anode,
    output wire [6:0] cathode,
    output red_LED, green_LED, blue_LED
    );


//assign led = 1;

//wire clk_out;
wire [1:0] refreshcounter;
wire clk_out;
wire [R:0] R_reg, B_reg, G_reg;
wire [4:0] res;  //encoder

clock CLOCK (
    .clk(clk),
    .clk_out(clk_out)
);

refreshcounter Refresh_wrapper(
 .refresh_clock(clk_out),
 .refreshcounter(refreshcounter)
);

 encoder ENCODER(
 .clk(clk_out),
 .ROT_A(ROT_A),
 .ROT_B(ROT_B),
 .btn(btn),
 .res(res)
);

BCD_contr BCD_CONTROLLER(
 .res(res),
 .refreshcounter(refreshcounter),
 .cathode(cathode)
);


anode_contr anode_control(
 .refreshcounter(refreshcounter),
 .anode(anode)
);

rgb_led R_RGB(
    .clk(clk_out),
    .reset_n(reeset_n),
    .res(res),
    .R_reg(R_reg),
    .G_reg(G_reg),
    .B_reg(B_reg)  
);
 
 rgb_delit PWM_RGB(
    .clk(clk_out),
    .reset_n(reset_n),
    .red_duty(R_reg),
    .green_duty(G_reg),
    .blue_duty(B_reg),
    .red_LED(red_LED),
    .green_LED(green_LED),
    .blue_LED(blue_LED)
 );
 


       
endmodule
