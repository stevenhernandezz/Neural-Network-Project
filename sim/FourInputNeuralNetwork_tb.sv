/***************************************************************************
***                                                                      ***
*** ECE 526 Final Project                Steven Hernandez, Fall, 2023    ***
***                                                                      ***
*** Final Project: Neural Network                                        ***
***                                                                      ***
****************************************************************************
*** Filename: FourInputNeuralNetwork_tb.sv Created by Steven Hernandez, 12/1/23   ***
***                                                                      ***
****************************************************************************
*** This testbench is for my four input neural network. Here i will be   ***
*** testing inputs, and biases. I will be randomizing weights between    ***
*** 0 and 1. I will also be displaying the final results.                ***
****************************************************************************/

`timescale 1 ns / 1ns
module FourInputNeuralNetwork_tb;

  // Declare signals for module ports
  reg [1:0] in1, in2, in3, in4;
  real w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15;
  reg [2:0] bias1, bias2, bias3, bias4;
  real out_o1, h1_out, h2_out, h3_out;

  // Instantiate the NeuralNetwork module
  FourInputNeuralNetwork uut(.in1(in1), .in2(in2), .in3(in3), .in4(in4),.w1(w1), .w2(w2), .w3(w3), .w4(w4), .w5(w5), .w6(w6),.w7(w7), .w8(w8), .w9(w9), .w10(w10), .w11(w11), .w12(w12),.w13(w13), .w14(w14), .w15(w15),.bias1(bias1), .bias2(bias2), .bias3(bias3), .bias4(bias4),.out_o1(out_o1), .h1_out(h1_out), .h2_out(h2_out), .h3_out(h3_out));

  // Testing
  initial begin
    $vcdpluson;

    // Set input values
    in1 = 2'b10;
    in2 = 2'b11;
    in3 = 2'b01; 
    in4 = 2'b10; 
    bias1 = 3'b001;
    bias2 = 3'b001;
    bias3 = 3'b001;
    bias4 = 3'b001;

    // Randomize weights from 0-1
    repeat (5) begin
      w1 = $urandom_range(0, 100) / 100.0;
      w2 = $urandom_range(0, 100) / 100.0;
      w3 = $urandom_range(0, 100) / 100.0;
      w4 = $urandom_range(0, 100) / 100.0;
      w5 = $urandom_range(0, 100) / 100.0;
      w6 = $urandom_range(0, 100) / 100.0;
      w7 = $urandom_range(0, 100) / 100.0;
      w8 = $urandom_range(0, 100) / 100.0;
      w9 = $urandom_range(0, 100) / 100.0;
      w10 = $urandom_range(0, 100) / 100.0;
      w11 = $urandom_range(0, 100) / 100.0;
      w12 = $urandom_range(0, 100) / 100.0;
      w13 = $urandom_range(0, 100) / 100.0;
      w14 = $urandom_range(0, 100) / 100.0;
      w15 = $urandom_range(0, 100) / 100.0;

      #20;
      /*//debugging purposes
        $display("\t\t ALL INPUTS & OUTPUTS");
       $display("Input1 = %d, Input2 = %d, Input3 = %d, Input4 = %d, weight1 = %.2f, weight2 = %.2f, weight3 = %.2f, weight4 = %.2f, weight5 = %.2f, weight6 = %.2f, weight7 = %.2f, weight8 = %.2f, weight9 = %.2f, weight10 = %.2f, weight11 = %.2f, weight12 = %.2f, weight13 = %.2f, weight14 = %.2f, weight15 = %.2f, bias1 = %d, bias2 = %d, bias3 = %d, bias4 = %d, h1_out = %.2f, h2_out = %.2f, h3_out = %.2f, out_o1 = %.2f", in1, in2, in3, in4, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, bias1, bias2, bias3, bias4, h1_out, h2_out, h3_out, out_o1);
    end

    // Display the results
    $display("\t\t TEST BENCH FINAL RESULTS");
    $display("Input1 = %d, Input2 = %d, Input3 = %d, Input4 = %d, out_o1 = %.4f, h1_out = %.4f, h2_out = %.4f, h3_out = %.4f", in1, in2, in3, in4, out_o1, h1_out, h2_out, h3_out);
    
    $display("FINAL OUTPUT = %d", out_o1);

    // End simulation*/
    end
    $finish;
  end

endmodule