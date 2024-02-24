`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////


module display_7seg(
    input wire [3:0] switch,
    output wire [6:0] a_to_g,
    output wire [7:0] an,
    output wire dp
    );
//assign an = 8'b11111110;
assign dp = 1;
hex7seg D1(.x(switch), .a_to_g(a_to_g), .an(an));
    
endmodule

module hex7seg(
    input wire [3:0] x,
    output reg [6:0] a_to_g,
    output reg [7:0] an
    );
//an = 8'b11111110;
always@(*)
begin
    case(x)
    0:  begin
        an = 8'b11111110;
        a_to_g = 7'b0000001;
        end
    1:  begin            
        an = 8'b11111110;   
        a_to_g = 7'b1001111;
        end
    2:  begin            
        an = 8'b11111110;
        a_to_g = 7'b0010010;
        end
    3:  begin 
        an = 8'b11111110;
        a_to_g = 7'b0000110;
        end
    4:  begin
        an = 8'b11111110;
        a_to_g = 7'b1001100;
        end
    5:  begin
        an = 8'b11111110;
        a_to_g = 7'b0100100;
        end
    6:  begin
        an = 8'b11111110;
        a_to_g = 7'b0100000;
        end
    7:  begin
        an = 8'b11111110; 
        a_to_g = 7'b0001111;
        end
    8:  begin
        an = 8'b11111110; 
        a_to_g = 7'b0000000; 
        end
    9:  begin
        an = 8'b11111110;
        a_to_g = 7'b0000100;
        end
    'hA:    begin
            an = 8'b11111100;
            a_to_g = 7'b0000001; 
            end
    'hB:    begin
            an = 8'b11111100;
            a_to_g = 7'b1001111; 
            end
    'hC:    begin
            an = 8'b11111100; 
            a_to_g = 7'b0010010; 
            end
    'hD:    begin
            an = 8'b11111100;
            a_to_g = 7'b0000110; 
            end
    'hE:    begin
            an = 8'b11111100;
            a_to_g = 7'b1001100;
            end 
    'hF:    begin
            an = 8'b11111100;
            a_to_g = 7'b0100100; 
            end
    default a_to_g = 7'b0000001;
    
endcase
end
endmodule    
