`timescale 1ns / 1ps

module cathode_contr(
    input [13:0] res,
    input [1:0] refreshcounter, 
    output reg [6:0] cathode = 0
    );



always@(refreshcounter)
begin      
//Redo it!! dividing a number by digits
    case (refreshcounter)//digit of the number
        2'b00://units, first digit
            begin 
                case (res%10)
                    0: cathode = 7'b1000000;//segments
                    1: cathode = 7'b1111001;
                    2: cathode = 7'b0100100;
                    3: cathode = 7'b0110000;
                    4: cathode = 7'b0011001;
                    5: cathode = 7'b0010010;
                    6: cathode = 7'b0000010;
                    7: cathode = 7'b1111000;
                    8: cathode = 7'b0000000;
                    9: cathode = 7'b0010000;
                    default cathode = 7'b1000000;
                endcase
            end
        
        2'b01://decade
            begin 
                case (res%100-res%10)//replace with triggers
                    10:  cathode = 7'b1111001; 
                    20:  cathode = 7'b0100100; 
                    30:  cathode = 7'b0110000; 
                    40:  cathode = 7'b0011001; 
                    50:  cathode = 7'b0010010; 
                    60:  cathode = 7'b0000010; 
                    70:  cathode = 7'b1111000; 
                    80:  cathode = 7'b0000000; 
                    90:  cathode = 7'b0010000; 
                    default cathode = 7'b1000000;
               endcase
            end

        2'b10://hundreds
            begin 
                    if (res>=100 && res<=199) cathode = 7'b1111001;
                   else if (res>=200 && res<=299) cathode = 7'b0100100;
                    else if (res>=300 && res<=399) cathode = 7'b0110000;
                     else if (res>=400 && res<=499) cathode = 7'b0011001;
                    else if (res>=500 && res<=599) cathode = 7'b0010010;
                   else if (res>=600 && res<=699) cathode = 7'b0000010;
                   else if (res>=700 && res<=799) cathode = 7'b1111000;
                  else  if (res>=800 && res<=899) cathode = 7'b0000000;
                   else if (res>=900 && res<=999) cathode = 7'b0010000;
                   else cathode = 7'b1000000;
            end
            
        2'b11://thousands
           
            begin 
                case (res%10000 - res%1000 - res%100 - res%10)
                    1000:  cathode = 7'b1111001; 
                    2000:  cathode = 7'b0100100; 
                    3000:  cathode = 7'b0110000; 
                    4000:  cathode = 7'b0011001; 
                    5000:  cathode = 7'b0010010; 
                    6000:  cathode = 7'b0000010; 
                    7000:  cathode = 7'b1111000; 
                    8000:  cathode = 7'b0000000; 
                    9000:  cathode = 7'b0010000; 
                    default cathode = 7'b1000000;
                endcase
            end
    endcase
end

endmodule
