`timescale 1ns / 1ps

module anode_contr(
    input [1:0] refreshcounter,
    output reg [7:0] anode = 0
    );
    
always@(refreshcounter)//разряд
begin
    case (refreshcounter)
        2'b00:                                         
            anode = 8'b11111110;                       
        2'b01:                                         
            anode = 8'b11111101;                       
        2'b10:                                         
            anode = 8'b11111011;                       
        2'b11:                                         
            anode = 8'b11110111;                       
    endcase
end
endmodule
