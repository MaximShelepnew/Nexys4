`timescale 1ns / 1ps

module top_module(
    input wire clk,
    input wire ROT_A,//JB1 - G14
    input wire ROT_B,//JB2 - P15
    input wire btn,//JB3 - V11
    output wire [7:0] anode,
    output wire [6:0] cathode
    );
    
wire [1:0] refreshcounter;
wire clk_out;
wire [13:0] res;  
wire rotary_second;
    
clock_dff delitel(
 .clk(clk),
 .clk_out(clk_out)
);

refreshcounter Refresh_wrapper(//the bit depth of the number
 .refresh_clock(clk_out),
 .refreshcounter(refreshcounter)
);

encoder ENCODER(//fix the rotation of the pmod-connected encoder
 .clk_encod(clk_out),
 .ROT_A(ROT_A),
 .ROT_B(ROT_B),
 .btn(btn),
 .res(res)
);


cathode_contr cathode_contr(//7 segment display
 .res(res),
 .refreshcounter(refreshcounter),
 .cathode(cathode)
);

anode_contr anode_control(
 .refreshcounter(refreshcounter),
 .anode(anode)
);

endmodule
