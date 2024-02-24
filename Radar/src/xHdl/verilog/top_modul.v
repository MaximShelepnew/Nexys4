`timescale 1ns / 1ps

module top_modul(
    input wire clk,
    input wire echo,
    output wire [7:0] anode,
    output wire [6:0] cathode,
    output wire trig
    );

wire [20:0] distance;
wire clk_out;
wire counter = 0;

clk_modul clock_del(
    .clk(clk),
    .clk_out(clk_out)
);

trig_signal TRIG(
    .clk(clk_out),
    .echo(echo),
    .trig(trig),
    .distance(distance),
    .counter(counter)
);

distance_calc DISPLAY_DISTANCE(
    .clk(clk_out),
    .distance(distance),
    .cathode(cathode),
    .anode(anode)
);
    
endmodule
