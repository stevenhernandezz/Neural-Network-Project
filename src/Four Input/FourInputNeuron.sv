/***************************************************************************
***                                                                      ***
*** ECE 526 Final Project                Steven Hernandez, Fall, 2023    ***
***                                                                      ***
*** Final Project: Neural Network                                        ***
***                                                                      ***
****************************************************************************
*** Filename: FourInputNeuron.sv    Created by Steven Hernandez, 12/1/23 ***
***                                                                      ***
****************************************************************************
*** This module is for my Neuron. This will be used to take in 4 inputs, ***
*** multiply it by its weight and add it to its bias. It will then be    ***
*** sent to the activation module.                                       ***
****************************************************************************/

`timescale 1 ns / 1ns
module FourInputNeuron(in1, in2, in3, in4, w1, w2, w3, w4, bias, out);
      // I.O
  input [1:0] in1, in2, in3, in4;
  input real w1, w2, w3, w4;
  input [2:0] bias;
  output real out;
  
  // Reg
  real total, temp_total;
  real activation;
  reg [7:0] exp;
  
  real base = 2.71828;
  real exponent;

  FourInputActivation act(.a_input(total), .out(out), .activation(activation));

  always @* begin
    // Weight inputs, add bias
    temp_total = (w1 * in1) + (w2 * in2) + (w3 * in3) + (w4 * in4) + bias;
    $display("\t\t INDIVIDUAL NEURON STAGE");
    $display("temp_total = %.2f, w1 = %.2f, w2 = %.2f, w3 = %.2f, w4 = %.2f, in1 = %.2f, in2 = %.2f, in3 = %.2f, in4 = %.2f",
              temp_total, w1, w2, w3, w4, in1, in2, in3, in4);
    
    total = -temp_total;
    $display("TOTAL = %.2f", total);
  end
endmodule
 