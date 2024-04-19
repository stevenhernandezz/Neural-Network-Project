/***************************************************************************
***                                                                      ***
*** ECE 526 Final Project                Steven Hernandez, Fall, 2023    ***
***                                                                      ***
*** Final Project: Neural Network                                        ***
***                                                                      ***
****************************************************************************
*** Filename: NeuralNetwork.sv       Created by Steven Hernandez, 12/1/23***
***                                                                      ***
****************************************************************************
*** This module is for my neural network where i will be making a 2 input***
*** network with 2 hidden layers and an output layer. Here i will have   ***
*** randomized weights between 0-1. I will be using my activation and    ***
*** neuron modules to make this neural network. I will also be using     ***
*** display functions for debugging and double checking calculations.    ***
****************************************************************************/

`timescale 1 ns / 1ns
module NeuralNetwork(in1, in2, h1_out, h2_out, w1, w2, w3, w4, w5, w6, bias1, bias2, bias3, out_o1);
    	//I.O
        input [1:0] in1, in2;
        input real w1, w2, w3, w4, w5, w6;
        input [2:0] bias1, bias2, bias3;
         output real out_o1, h1_out, h2_out;
        
         reg signed [3:0] total_h1, total_h2, total_o1;
        reg [3:0] activation_h1, activation_h2, activation_o1;


    // Neuron instances
        Neuron h1(.in1(in1), .in2(in2), .w1(w1), .w2(w2), .bias(bias1), .out(h1_out));
        Neuron h2(.in1(in1), .in2(in2), .w1(w3), .w2(w4), .bias(bias2), .out(h2_out));
  
   // Activation instances
        Activation A1_out_h1(.a_input(total_h1), .out(out_h1), .activation(activation_h1));
        Activation A2_out_h2(.a_input(total_h2), .out(out_h2), .activation(activation_h2));
  
  // Neuron o1 takes the weighted sum of h1 and h2 along with bias
        LastOutputNeuron o1(.in1(h1_out), .in2(h2_out), .w1(w5), .w2(w6), .bias(bias3), .out(total_o1));
        Activation A3_out_o1(.a_input(total_o1), .out(out_o1), .activation(activation_o1));
endmodule 