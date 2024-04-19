/***************************************************************************
***                                                                      ***
*** ECE 526 Final Project                Steven Hernandez, Fall, 2023    ***
***                                                                      ***
*** Final Project: Neural Network                                        ***
***                                                                      ***
****************************************************************************
*** Filename: LastOutputNeuron.sv  Created by Steven Hernandez, 12/1/23  ***
***                                                                      ***
****************************************************************************
*** This module is for my last output neuron. This is similar to my      ***
*** neuron main code file except it is specifically made form my final   ***
*** output. This was created to verify the final output.                 ***
****************************************************************************/

`timescale 1 ns / 1ns
module LastOutputNeuron(in1, in2, w1, w2, bias, out);
      // I.O
  input [1:0] in1, in2;
  input real w1, w2;
  input [2:0] bias;
  output real out;
  
  // Reg
  real total, temp_total;
  real activation;
  reg [7:0] exp;
  
  real base = 2.71828;
  real exponent;

  Activation act(.a_input(total), .out(out), .activation(activation));

  always @* begin
    // Weight inputs, add bias
    temp_total = (w1 * in1) + (w2 * in2) + bias;
    $display("\t\t INDIVIDUAL NEURON STAGE");
    $display("temp_total = %.2f, w1 = %.2f, w2 = %.2f, in1 = %.2f, in2 = %.2f",
              temp_total, w1, w2,in1, in2,);
    
    total = -temp_total;
    $display("TOTAL = %.2f", total);
  end
endmodule