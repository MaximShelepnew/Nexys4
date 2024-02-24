`timescale 1ns / 1ps

module testbench;

reg clk=0;
reg echo;
wire [7:0] anode;
wire [6:0] cathode;
wire trig;

top_modul UUT (clk, echo, anode, cathode, trig);
always #5 clk = ~clk;

//initial
//begin

//    echo=1;
//    #10 $finish;        
//end

endmodule
