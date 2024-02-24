`timescale 1ns / 1ps

module display_encoder(
    input wire [13:0] res,
    output reg [6:0] cathode = 0
    );
    
always@(posedge res)
begin
    case (res)//разр€д
        2'b00://единицы, первый разр€д
            begin 
                case (res%10)
                    0: cathode = 7'b1000000;//сегменты
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
        
        2'b01://дес€тки
            begin 
                case (res%100-res%10)
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

        2'b10://сотни
            begin 
                
                case (res % 1000 - res % 100 - res % 10)                 
                    100:  cathode = 7'b1111001; 
                    200:  cathode = 7'b0100100; 
                    300:  cathode = 7'b0110000; 
                    400:  cathode = 7'b0011001; 
                    500:  cathode = 7'b0010010; 
                    600:  cathode = 7'b0000010; 
                    700:  cathode = 7'b0000111; 
                    800:  cathode = 7'b0000000; 
                    900:  cathode = 7'b0010000; 
                    default cathode = 7'b1000000;
                endcase
            end
            
        2'b11://тыс€чи
            begin 
                case (res % 10000 - res % 1000 - res % 100 - res % 10)
                    1000:  cathode = 7'b1111001; 
                    2000:  cathode = 7'b0100100; 
                    3000:  cathode = 7'b0110000; 
                    4000:  cathode = 7'b0011001; 
                    5000:  cathode = 7'b0010010; 
                    6000:  cathode = 7'b0000010; 
                    7000:  cathode = 7'b0000111; 
                    8000:  cathode = 7'b0000000; 
                    9000:  cathode = 7'b0010000; 
                    default cathode = 7'b1000000;
                endcase
            end
    endcase
end    
endmodule
