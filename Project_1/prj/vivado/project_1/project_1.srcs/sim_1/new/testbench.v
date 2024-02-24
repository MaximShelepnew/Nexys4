`timescale 10ns / 1ps

module testbench;
    
    reg [3:0] switch = 0;
    wire [6:0] a_to_g;
    wire [7:0] an;
    wire dp;

display_7seg uut(
    .switch(switch),
    .a_to_g(a_to_g),
    .an(an),
    .dp(dp)
);

integer k=0;

initial
begin
    switch=0;
    
    for (k=0;k<16;k=k+1)
    #10 switch=k;
    //hex7seg D1(.x(sw), .a_to_g(a_to_g));
    #5 $finish;
    
end

endmodule
