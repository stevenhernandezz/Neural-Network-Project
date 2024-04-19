/***************************************************************************
***                                                                      ***
*** ECE 526 Final Project                Steven Hernandez, Fall, 2023    ***
***                                                                      ***
*** Final Project: Neural Network                                        ***
***                                                                      ***
****************************************************************************
*** Filename: FinalOutputNeuron.sv  Created by Steven Hernandez, 12/1/23  ***
***                                                                      ***
****************************************************************************
*** This module is for my last output neuron. This is similar to my      ***
*** neuron main code file except it is specifically made form my final   ***
*** output. This was created to verify the final output.                 ***
****************************************************************************/

`timescale 1 ns / 1ns
module FinalOutputNeuron(in1, in2, in3, w1, w2, w3, bias, out);
      // I.O
  input [1:0] in1, in2, in3;
  input real w1, w2, w3;
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
    temp_total = (w1 * in1) + (w2 * in2) + (w3 * in3) + bias;
    $display("\t\t INDIVIDUAL NEURON STAGE");
    $display("temp_total = %.2f, w1 = %.2f, w2 = %.2f, w3 = %.2f, in1 = %.2f, in2 = %.2f, in3 = %.2f",
              temp_total, w1, w2, w3, in1, in2, in3);
    
    total = -temp_total;
    $display("TOTAL = %.2f", total);
  end
endmodule