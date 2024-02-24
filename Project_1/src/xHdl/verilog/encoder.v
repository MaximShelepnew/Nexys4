`timescale 1ns / 1ps

module encoder(
    input wire clk_encod,//clk
    input wire ROT_A,//
    input wire ROT_B,//
    input wire btn,
    output reg [13:0] res = 0// объ€вить в основном модуле
    );

reg [1:0] rotary_in;//входной регистр
reg rotary_second = 0;//регистр второго срабатывани€
reg rotary_first_A;//регистр срабатывани€ ј
reg delay_rotary_second;//регистр задержки второго срабатывани€ 

always @(posedge clk_encod)
    begin
     
        rotary_in[1] <= ROT_A;
        rotary_in[0] <= ROT_B;
        
        case (rotary_in)
            2'b00:
                begin 
                    rotary_second <= 0;//сброшен регистр второго срабатывани€
                    rotary_first_A <= rotary_first_A;
                end
            2'b01:
                begin
                    rotary_second <= rotary_second;
                    rotary_first_A <= 0;//¬ сработал первым
                end
            2'b10:
                begin
                    rotary_second <= rotary_second;
                    rotary_first_A <= 1;//A сработал первым
                end
            2'b11:
                begin
                    rotary_second <= 1;//второе срабатывание
                    rotary_first_A <= rotary_first_A;
                end
        endcase
        delay_rotary_second <= rotary_second;//задержка второго срабатывани€
        
        if (delay_rotary_second == 1 && rotary_second == 0)
            begin
                if (rotary_first_A == 0)
                    begin
                    res <= res + 1;
                    end 
                else
                    begin
                    res <= res - 1;
                    end 
            end 

           if (btn == 0) res <= 0;   
                      
    end  
endmodule
