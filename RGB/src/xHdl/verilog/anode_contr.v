`timescale 1ns / 1ps

module anode_contr(
    input [1:0] refreshcounter,
    output reg [7:0] anode = 0
    );
    
always@(refreshcounter)//digit of the number
begin
    case (refreshcounter)
        2'b00:                                         
            anode = 8'b11101110;                       
        2'b01:                                         
            anode = 8'b11011101;                       
        2'b10:                                         
            anode = 8'b10111011;                       
        2'b11:                                         
            anode = 8'b01110111;                       
    endcase
end
endmodule
