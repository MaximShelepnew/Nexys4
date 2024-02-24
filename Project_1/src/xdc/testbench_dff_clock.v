`timescale 1ns / 1ps

module testbench_dff_clock;

reg clk = 0;
reg ROT_A;
reg ROT_B;
reg btn;
wire [7:0] anode;
wire [6:0] cathode;


top_module UUT (clk, ROT_A, ROT_B, btn, anode, cathode);
always #5 clk = ~clk;

integer i = 0;

initial
begin
    ROT_A = 0;
    ROT_B = 1;
     for (i=0;i<1000;i=i+1)
     begin
     #10 if (ROT_A == 0 && ROT_B == 1) 
            begin
            ROT_A = 1;
            ROT_B = 1;
            end
         else
         #10 if (ROT_A == 0 && ROT_B == 0) 
            begin
            ROT_A = 0;
            ROT_B = 1;
            end  
            else 
            #10 if (ROT_A == 1 && ROT_B == 0) 
            begin
            ROT_A = 0;
            ROT_B = 0;
            end 
              else   #10 if (ROT_A == 1 && ROT_B == 1) 
                        begin
                        ROT_A = 1;
                        ROT_B = 0;
                        end
     end   
        
    #100 $finish; 
      
end

endmodule
