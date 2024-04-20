/***************************************************************************
***                                                                      ***
*** ECE 526 Final Project                Steven Hernandez, Fall, 2023    ***
***                                                                      ***
*** Final Project: Neural Network                                        ***
***                                                                      ***
****************************************************************************
*** Filename: FourInputNeuralNetwork.sv Created by Steven Hernandez, 12/1/23***
***                                                                      ***
****************************************************************************
*** This module is for my neural network where i will be making a 4 input***
*** network with 3 hidden layers and an output layer. Here i will have   ***
*** randomized weights between 0-1. I will be using my activation and    ***
*** neuron modules to make this neural network. I will also be using     ***
*** display functions for debugging and double checking calculations.    ***
****************************************************************************/
 
`timescale 1 ns / 1ns
module FourInputNeuralNetwork(in1, in2, in3, in4,w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, bias1, bias2, bias3, bias4, out_o1, h1_out, h2_out, h3_out);
    	//I.O
        input [1:0] in1, in2, in3, in4;
        input real w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15;
        input [2:0] bias1, bias2, bias3, bias4;
         output real out_o1, h1_out, h2_out, h3_out;
        
         reg signed [3:0] total_h1, total_h2, total_h3, total_o1;
        reg [3:0] activation_h1, activation_h2, activation_h3, activation_o1;


    // Neuron instances
        FourInputNeuron h1(.in1(in1), .in2(in2), .in3(in3), .in4(in4), .w1(w1), .w2(w4), .w3(w7), .w4(w10), .bias(bias1), .out(h1_out));
        FourInputNeuron h2(.in1(in1), .in2(in2), .in3(in3), .in4(in4), .w1(w2), .w2(w5), .w3(w8), .w4(w11), .bias(bias3), .out(h2_out));
        FourInputNeuron h3(.in1(in1), .in2(in2), .in3(in3), .in4(in4), .w1(w3), .w2(w6), .w3(w9), .w4(w12), .bias(bias3), .out(h3_out));
  
   // Activation instances
        FourInputActivation A1_out_h1(.a_input(total_h1), .out(out_h1), .activation(activation_h1));
        FourInputActivation A2_out_h2(.a_input(total_h2), .out(out_h2), .activation(activation_h2));
        FourInputActivation A3_out_h2(.a_input(total_h3), .out(out_h3), .activation(activation_h3));
  
  // Neuron o1 takes the weighted sum of h1 and h2 along with bias
        FinalOutputNeuron o1(.in1(h1_out), .in2(h2_out), .in3(h3_out), .w1(w13), .w2(w14), .w3(w15), .bias(bias4), .out(total_o1));
        FourInputActivation A4_out_o1(.a_input(total_o1), .out(out_o1), .activation(activation_o1));
endmodule 