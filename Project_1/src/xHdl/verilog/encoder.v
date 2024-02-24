`timescale 1ns / 1ps

module encoder(
    input wire clk_encod,//clk
    input wire ROT_A,//
    input wire ROT_B,//
    input wire btn,
    output reg [13:0] res = 0// 
    );

reg [1:0] rotary_in;//input register
reg rotary_second = 0;//the register of the second operation
reg rotary_first_A;//trigger register A
reg delay_rotary_second;//the delay register of the second operation

always @(posedge clk_encod)
    begin
     
        rotary_in[1] <= ROT_A;
        rotary_in[0] <= ROT_B;
        
        case (rotary_in)
            2'b00:
                begin 
                    rotary_second <= 0;//the second trigger register has been reset
                    rotary_first_A <= rotary_first_A;
                end
            2'b01:
                begin
                    rotary_second <= rotary_second;
                    rotary_first_A <= 0;//B worked first
                end
            2'b10:
                begin
                    rotary_second <= rotary_second;
                    rotary_first_A <= 1;//A worked first
                end
            2'b11:
                begin
                    rotary_second <= 1;//the second trigger
                    rotary_first_A <= rotary_first_A;
                end
        endcase
        delay_rotary_second <= rotary_second;//delay of the second operation
        
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
