/*
  Yiyi Chen
  chen1234@purdue.edu

  alu file test bench
*/

// mapped needs this
`include "alu_file_if.vh"
`include "cpu_types_pkg.vh"

import cpu_types_pkg::*;


// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module alu_file_tb;

  parameter PERIOD = 10;

  // interface
  alu_file_if aluf ();
  // test program
  test PROG (aluf);
  // DUT
`ifndef MAPPED
  alu_file DUT(aluf);
`else
  alu_file DUT(
    .\aluf.input_a (aluf.input_a),
    .\aluf.input_b (aluf.input_b),
    .\aluf.aluop (aluf.aluop),
    .\aluf.neg (aluf.neg),
    .\aluf.overflow (aluf.overflow),
    .\aluf.zero (aluf.zero),
    .\aluf.out (aluf.out)
  );
`endif

endmodule // alu_file_tb

program test (alu_file_if.tb alu_tb);

   int testcae = 1;

   initial begin
      //TEST 1
      alu_tb.input_a = 32'h3;
      alu_tb.input_b = 32'h1;
      alu_tb.aluop = ALU_SLL;

      #(5)
      assert (alu_tb.out == 32'h6)
	$display("Test case 1 passed!");
      else
	$display("Test case 1 failed!");

      #(5)
      
      //2
      alu_tb.input_a = 32'hC;
      alu_tb.input_b = 32'h1;
      alu_tb.aluop = ALU_SRL;

      #(5)
      assert (alu_tb.out == 32'h6)
	$display("Test case 2 passed!");
      else
	$display("Test case 2 failed!");

      #(5)

      //3
      alu_tb.input_a = 32'h5;
      alu_tb.input_b = 32'h7;
      alu_tb.aluop = ALU_ADD;

      #(5)
      assert (alu_tb.out == 32'hC)
	$display("Test case 3 passed!");
      else
	$display("Test case 3 failed!");

      #(5)

      //4
      alu_tb.input_a = 32'hE;
      alu_tb.input_b = 32'h5;
      alu_tb.aluop = ALU_SUB;

      #(5)
      assert (alu_tb.out == 32'h9)
	$display("Test case 4 passed!");
      else
	$display("Test case 4 failed!");

      #(5)

      //5
      alu_tb.input_a = 32'h9;
      alu_tb.input_b = 32'h5;
      alu_tb.aluop = ALU_AND;

      #(5)
      assert (alu_tb.out == 32'h1)
	$display("Test case 5 passed!");
      else
	$display("Test case 5 failed!");

      #(5)

      //6
      alu_tb.input_a = 32'h9;
      alu_tb.input_b = 32'h6;
      alu_tb.aluop = ALU_OR;

      #(5)
      assert (alu_tb.out == 32'hF)
	$display("Test case 6 passed!");
      else
	$display("Test case 6 failed!");

      #(5)

      //7
      alu_tb.input_a = 32'hC;
      alu_tb.input_b = 32'h6;
      alu_tb.aluop = ALU_XOR;
      

      #(5)
      assert (alu_tb.out == 32'hA)
	$display("Test case 7 passed!");
      else
	$display("Test case 7 failed!");

      #(5)

      //8
      alu_tb.input_a = 32'hA;
      alu_tb.input_b = 32'h4;
      alu_tb.aluop = ALU_NOR;

      #(5)
      assert (alu_tb.out == 32'hFFFFFFF1)
	$display("Test case 8 passed!");
      else
	$display("Test case 8 failed!");

      #(5)

      //9
      alu_tb.input_a = 32'hA;
      alu_tb.input_b = 32'hC;
      alu_tb.aluop = ALU_SLT;

      #(5)
      assert (alu_tb.out == 1)
	$display("Test case 9 passed!");
      else
	$display("Test case 9 failed!");

      #(5)

      //10
      alu_tb.input_a = 32'hD;
      alu_tb.input_b = 32'h5;
      alu_tb.aluop = ALU_SLTU;

      #(5)
      assert (alu_tb.out == 0)
	$display("Test case 10 passed!");
      else
	$display("Test case 10 failed!");

      #(5)

      //11
      alu_tb.input_a = 32'hFFFFFFFF;
      alu_tb.input_b = 32'hFFFFFFFF;
      alu_tb.aluop = ALU_ADD;

      #(5)
      assert (alu_tb.overflow == 1)
	$display("Test case 11 passed!");
      else
	$display("Test case 11 failed!");

      #(5)

      //12
      alu_tb.input_a = 32'h7FFFFFFF;
      alu_tb.input_b = 32'hFFFFFFFF;
      alu_tb.aluop = ALU_SUB;

      #(5)
      assert (alu_tb.overflow == 1)
	$display("Test case 12 passed!");
      else
	$display("Test case 12 failed!");

   end // initial begin
endprogram // test
   
