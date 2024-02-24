`timescale 1ns / 1ps

module cathode_res(
    input wire [4:0] res,
    input [1:0] refreshcounter, 
    output reg [6:0] Rcathode = 0
    );



always@(refreshcounter)
begin      
//   anode = 8'b11111110;    
//   case (res % 4'b1010)
//                    0: cathode = 7'b1000000;//сегменты
//                    1: cathode = 7'b1111001;
//                    2: cathode = 7'b0100100;
//                    3: cathode = 7'b0110000;
//                    4: cathode = 7'b0011001;
//                    5: cathode = 7'b0010010;
//                    6: cathode = 7'b0000010;
//                    7: cathode = 7'b1111000;
//                    8: cathode = 7'b0000000;
//                    9: cathode = 7'b0010000;
//                    //switch%100>99 && switch%100<=199 : cathode = 7'b0000001;
//                    default cathode = 7'b1000000;
//                endcase 
    case (refreshcounter)//разр€д
        2'b00://единицы, первый разр€д
            begin 
                case (res%10)
                    0: Rcathode = 7'b1000000;//сегменты
                    1: Rcathode = 7'b1111001;
                    2: Rcathode = 7'b0100100;
                    3: Rcathode = 7'b0110000;
                    4: Rcathode = 7'b0011001;
                    5: Rcathode = 7'b0010010;
                    6: Rcathode = 7'b0000010;
                    7: Rcathode = 7'b1111000;
                    8: Rcathode = 7'b0000000;
                    9: Rcathode = 7'b0010000;
                    //res%100>99 && res%100<=199 : Rcathode = 7'b0000001;
                    default Rcathode = 7'b1000000;
                endcase
            end
        
        2'b01://дес€тки
            begin 
                case (res%100-res%10)
                    10:  Rcathode = 7'b1111001; 
                    20:  Rcathode = 7'b0100100; 
                    30:  Rcathode = 7'b0110000; 
                    40:  Rcathode = 7'b0011001; 
                    50:  Rcathode = 7'b0010010; 
                    60:  Rcathode = 7'b0000010; 
                    70:  Rcathode = 7'b1111000; 
                    80:  Rcathode = 7'b0000000; 
                    90:  Rcathode = 7'b0010000; 
                    default Rcathode = 7'b1000000;
               endcase
            end

        2'b10://сотни
            begin 
                
              //  case (res)
                    if (res>=100 && res<=199) Rcathode = 7'b1111001;
                   else if (res>=200 && res<=299) Rcathode = 7'b0100100;
                    else if (res>=300 && res<=399) Rcathode = 7'b0110000;
                     else if (res>=400 && res<=499) Rcathode = 7'b0011001;
                    else if (res>=500 && res<=599) Rcathode = 7'b0010010;
                   else if (res>=600 && res<=699) Rcathode = 7'b0000010;
                   else if (res>=700 && res<=799) Rcathode = 7'b1111000;
                  else  if (res>=800 && res<=899) Rcathode = 7'b0000000;
                   else if (res>=900 && res<=999) Rcathode = 7'b0010000;
                   else Rcathode = 7'b1000000;
//                    100:  Rcathode = 7'b1111001; 
//                    200:  Rcathode = 7'b0100100; 
//                    300:  Rcathode = 7'b0110000; 
//                    400:  Rcathode = 7'b0011001; 
//                    500:  Rcathode = 7'b0010010; 
//                    600:  Rcathode = 7'b0000010; 
//                    700:  Rcathode = 7'b1111000; 
//                    800:  Rcathode = 7'b0000000; 
//                    900:  Rcathode = 7'b0010000; 
//                    default Rcathode = 7'b1000000;
               // endcase
            end
            
        2'b11://тыс€чи
           
            begin 
                case (res%10000 - res%1000 - res%100 - res%10)
                    1000:  Rcathode = 7'b1111001; 
                    2000:  Rcathode = 7'b0100100; 
                    3000:  Rcathode = 7'b0110000; 
                    4000:  Rcathode = 7'b0011001; 
                    5000:  Rcathode = 7'b0010010; 
                    6000:  Rcathode = 7'b0000010; 
                    7000:  Rcathode = 7'b1111000; 
                    8000:  Rcathode = 7'b0000000; 
                    9000:  Rcathode = 7'b0010000; 
                    default Rcathode = 7'b1000000;
                endcase
            end
    endcase
end

endmodule
