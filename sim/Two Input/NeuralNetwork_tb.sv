/***************************************************************************
***                                                                      ***
*** ECE 526 Final Project                Steven Hernandez, Fall, 2023    ***
***                                                                      ***
*** Final Project: Neural Network                                        ***
***                                                                      ***
****************************************************************************
*** Filename: NeuralNetwork_tb.sv Created by Steven Hernandez, 12/1/23   ***
***                                                                      ***
****************************************************************************
*** This testbench is for my neural network. Here i will be testing      ***
*** inputs, and biases. I will be randomizing weights between 0 and 1.   ***
*** I will also be displaying the final results.                         ***
****************************************************************************/

`timescale 1 ns / 1ns
module NeuralNetwork_tb;

  // Declare signals for module ports
  reg [1:0] in1, in2;
  real w1, w2, w3, w4, w5, w6;
  reg [2:0] bias1, bias2, bias3;
   real out_o1, h1_out, h2_out;

  // Instantiate the NeuralNetwork module
  NeuralNetwork uut(.in1(in1), .in2(in2),.w1(w1), .w2(w2), .w3(w3), .w4(w4), .w5(w5), .w6(w6),.bias1(bias1), .bias2(bias2), .bias3(bias3),.out_o1(out_o1), .h1_out(h1_out), .h2_out(h2_out));

  // testing 
  initial begin
  $vcdpluson;
    // Set input values
    in1 = 2'b10;
    in2 = 2'b11;
    bias1 = 3'b001;
    bias2 = 3'b001;
    bias3 = 3'b001;

  // Randomize weights from 0-1
     repeat (5) begin
      w1 = $urandom_range(0, 100) / 100.0;
      w2 = $urandom_range(0, 100) / 100.0;
      w3 = $urandom_range(0, 100) / 100.0;
      w4 = $urandom_range(0, 100) / 100.0;
      w5 = $urandom_range(0, 100) / 100.0;
      w6 = $urandom_range(0, 100) / 100.0;
      #20;

    // End simulation
    end 
    $finish;
  end

endmodule