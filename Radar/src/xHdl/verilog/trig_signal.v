`timescale 1ns / 1ps

module trig_signal(
    input wire clk,
    input wire echo,//???
    output reg trig,
    output [20:0] distance,
    output reg [25:0] counter = 0
    );
    
reg [20:0] dist_counter = 0;
//reg [25:0] counter = 0;
reg [20:0] echo_time = 0;
reg waitn;

always@(posedge clk)
begin
    trig <= 1;
    //#100000
//    if (counter == 0) trig <= 1;
//    else
//        if (counter == 1000)
//            begin
//                waitn <= 1;
//                trig <= 0;
//            end
//        else if (counter == 3800000)
//                begin
//                    trig <= 1;
//                    counter <= 0;
//                end 
//    counter = counter + 1;
    if (echo == 1)
        begin
            dist_counter <= dist_counter+1;
        end    
//    else if (echo == 0 && waitn == 1)
//            begin
//                dist_counter = 0;
//                waitn = 0;
//                echo_time <= dist_counter;
//            end 
//        else if (counter == 100000000)
//            begin
//                counter = 0;
//                trig <= 0;
//                dist_counter = 0;
//            end  
       echo_time <= dist_counter;                                        
end  
  
   assign distance = echo_time;//умножить или поделить 
   
endmodule
