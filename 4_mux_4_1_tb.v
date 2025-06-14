// 4-to-1 mux - testbench
`timescale 1ns/1ps
`include "mux_4_1.v"
module mux4_1_tb();
  reg a, b, c, d;
  reg [1:0] sel;
  wire out;
  integer count = 0;

  // instantiate mux RTL
  mux4_1 u1(out, a, b, c, d, sel);

  initial begin
    a = 1'b1; b = 1'b0; d = 1'bx; c = 1'bz;
    for (count = 0; count < 10; count = count + 1) begin
      #5;
      sel = 2'b00 + count;
      $display($time, "sel = %0d, a=%0d, b=%0d, c=%0d, d=%0d, out%0d", sel,a,b,c,d,out);
    end
  end

  // run for 100 time units
  initial
    #100 $finish;

  // waveform dump
  initial begin
  $recordfile("mux.trn");
  $recordvars;
  end
endmodule
