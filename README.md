# Nexys4
Projects for the Nexus-4 Artix-7 debugging board

### Project_1
A verilog project that uses a seven-segment indicator to display the number of turns of the KY-040 encoder.
The entry point of the top_module project is located along the path Project_1/src/xHdl/verilog/top_module.v and contains components such as:
  * clock_dff: A module for dividing the clock frequency;
  * refreshcounter: A module for generating an indicator refresh signal;
  * encoder: Module for reading signals from the encoder;
  * cathode_contr: A module for controlling the cathode terminals of a seven-segment indicator;
  * anode_contr: A module for controlling the terminals of the anodes of a seven-segment indicator.

To launch a project in the Vivado program, run the file project_1.xpr that is located along the path Project_1/prj/vivado/project_1/project_1.xpr 


### RGB
A project with RGB LED control using the KY-040 encoder. 
The top_modul top-level project is located along the path RGB/src/xHdl/verilog/top_modul.v and contains the components of the project:
  * clock: A module for dividing the clock frequency.
  * refreshcounter: A module for generating a component update signal.
  * encoder: A module for reading the signals from the encoder and the button.
  * BCD_contr: A module for controlling a seven-segment indicator.
  * rgb_led: A module for controlling RGB LEDs.
  * rgb_delit: A module for generating PWM signals for RGB LEDs.

To launch a project in the Vivado program, run the file rgb.xpr that is located along the path RGB/prj/vivado/rgb/rgb.xpr      


### Radar
The verilog project, which uses a seven-segment indicator to display the distance to be obtained from the HC-SR04 ultrasonic radar.
The top-level file of this top_modul project is located along the path Radar/src/xHdl/verilog/top_modul.v and contains components such as:
  * clk_modul: A module for dividing the clock frequency.
  * trig_signal: A module for generating a trigger signal and measuring the sensor response time.
  * distance_calc: A module for calculating distance based on response time and controlling a seven-segment indicator.

To launch a project in the Vivado program, run the file radar.xpr that is located along the path Radar/prj/vivado/radar/radar.xpr    
