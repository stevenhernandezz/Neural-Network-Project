/***************************************************************************
***                                                                      ***
*** ECE 526 Final Project                Steven Hernandez, Fall, 2023    ***
***                                                                      ***
*** Final Project: Neural Network                                        ***
***                                                                      ***
****************************************************************************
*** Filename: FourInputActivation.sv  Created by Steven Hernandez, 12/1/23   ***
***                                                                      ***
****************************************************************************
*** This module is Activation stage where the Neuron will be going       ***
*** through a sigmoid function.                                          ***
*** This is important as this will determine what will be pass through   ***
*** the network.                                                         ***
*** I will also be checking the output after the sigmoid function.       ***
*** Any value between 0.5 - 1 will be passed through while anything less ***
*** than 0.5 will not be passed through the network.                     ***
****************************************************************************/

`timescale 1 ns / 1ns
module FourInputActivation(out, a_input, activation);
      output real out;
      
      input real a_input;
      output reg [3:0] activation;
      reg [7:0] exp;
      
      real base = 2.71828;
      real exponent;

        always @* begin
        //activation stage 
          //exponent before sigmoid 
          exponent = base ** a_input;
          $display("\t\t EXPONENT BEFORE SIGMOID FORMULA IMPLEMENTATION"); 
	          $display("EXPONENT = %.4f ", exponent);
                     
        //sigmoid formula 
          out = 1 / (1+ exponent);
            $display("\t\t ACTIVATION STAGE OUTPUTS");
            $display("EXPONENT = %.4f, BASE = %.4f, OUT = %.4f",  exponent, base, out);
            
        // Binary classification check
          //final activation test to determine forwarding
    activation = (out >= 0.5) ? 4'b1 : 4'b0;
        $display("\t\t AFTER ACTIVATION STAGE");
        $display("EXPONENT = %.4f, OUT = %.4f, ACTIVATION = %.4f", exponent, out, activation);
  
end
endmodule