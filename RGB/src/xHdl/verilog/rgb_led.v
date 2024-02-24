`timescale 1ns / 1ps
`include "parameters.vh"


module rgb_led(
    input wire clk,
    input wire reset_n,
    input [4:0] res,
    output reg [R:0] R_reg, G_reg, B_reg 
    );

always@(posedge clk)
begin

    case (res)
    1'd1: 
        begin
            R_reg <= 60;
            G_reg <= 0;
            B_reg <= 0;
        end
    2: 
        begin
            R_reg <= 60;
            G_reg <= 15;
            B_reg <= 0;
        end 
    3: 
        begin
            R_reg <= 60;
            G_reg <= 30;
            B_reg <= 0;
        end
    4: 
        begin
            R_reg <= 60;
            G_reg <= 50;
            B_reg <= 0;
        end          
     5: 
        begin
            R_reg <= 60;
            G_reg <= 60;
            B_reg <= 0;
        end 
    6: 
        begin
            R_reg <= 0;
            G_reg <= 60;
            B_reg <= 0;
        end              
    7: 
        begin
            R_reg <= 0;
            G_reg <= 60;
            B_reg <= 10;
        end
    8: 
        begin
            R_reg <= 0;
            G_reg <= 60;
            B_reg <= 30;
        end 
    9: 
        begin
            R_reg <= 0;
            G_reg <= 60;
            B_reg <= 60;
        end 
    10: 
        begin
            R_reg <= 0;
            G_reg <= 0;
            B_reg <= 60;
        end
    11: 
        begin
            R_reg <= 0;
            G_reg <= 60;
            B_reg <= 60;
        end
    12: 
        begin
            R_reg <= 0;
            G_reg <= 0;
            B_reg <= 60;
            end
        13: 
        begin
            R_reg <= 0;
            G_reg <= 30;
            B_reg <= 60;
        end 
        14: 
        begin
            R_reg <= 0;
            G_reg <= 60;
            B_reg <= 0;
        end   
        15: 
        begin
            R_reg <= 60;
            G_reg <= 0;
            B_reg <= 0;
        end             
    default: 
        begin
            R_reg <= 126;
            G_reg <= 126;
            B_reg <= 126;
        end                                                     
    endcase
//    if (res<3) 
//        begin
//            R_reg <= 126;
//            G_reg <= 0;
//            B_reg <= 0;
//        end
//   else if (2<res<5) 
//        begin
//            R_reg <= 126;
//            G_reg <= 35;
//            B_reg <= 0;
//        end        
//   else if (4<res<7) 
//        begin
//            R_reg <= 126;
//            G_reg <= 75;
//            B_reg <= 0;
//        end
//   else if (6<res<8) 
//        begin
//            R_reg <= 126;
//            G_reg <= 126;
//            B_reg <= 0;
//        end        
//    else if (7<res<10) 
//        begin
//            R_reg <= 30;
//            G_reg <= 126;
//            B_reg <= 0;
//        end
//     else if (9<res<12) 
//        begin
//            R_reg <= 0;
//            G_reg <= 126;
//            B_reg <= 0;
//        end
//     else if (11<res<14) 
//        begin
//            R_reg <= 0;
//            G_reg <= 126;
//            B_reg <= 35;
//        end
//    else  if (13<res<16) 
//        begin
//            R_reg <= 0;
//            G_reg <= 126;
//            B_reg <= 75;
//        end
//    else  if (15<res<18) 
//        begin
//            R_reg <= 0;
//            G_reg <= 126;
//            B_reg <= 126;
//        end
//    else if (17<res<20) 
//        begin
//            R_reg <= 0;
//            G_reg <= 35;
//            B_reg <= 126;
//        end
//    else if (19<res) 
//        begin
//            R_reg <= 0;
//            G_reg <= 0;
//            B_reg <= 126;
//        end                                                                 
end
  
endmodule
