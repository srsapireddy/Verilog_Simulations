// Verilog Testbench
//==================
`timescale 1ns/1ps
`include "../programs/mux_ff_ex.v"

module mux_ff_ex_tb;
  reg resetn_tb, clk_tb;
  reg [0:0] i0_tb, i1_tb, i2_tb, i3_tb;
  wire q_tb;
  reg [1:0] sel_tb;
  integer count;

  // DUT instantiation
  mux_ff_ex mux_ff_ex_inst(i0_tb, i1_tb, i2_tb, i3_tb, clk_tb, resetn_tb, sel_tb, q_tb);

  // clock generation
  always #5 clk_tb = ~clk_tb;

  // Procedural
  initial begin
    $display($time, " Verilog Testbench Running\n");
    resetn_tb = 0; clk_tb = 0;
    i0_tb = 0; i1_tb = 1; i2_tb = 1'bx; i3_tb = 1'bz;
    sel_tb = 0;

    $display($time, " In reset \n");
    #6;
    $display($time, " Out of reset \n");
    resetn_tb = 1;

    for (count = 0; count < 4; count = count + 1) begin
      sel_tb = count;
      #10;
      if ((count == 0 && q_tb != i0_tb) ||
          (count == 1 && q_tb != i1_tb) ||
          (count == 2 && q_tb != i2_tb) ||
          (count == 3 && q_tb != i3_tb))
        $display($time, " ERROR - Data mismatch: count=%0d, actual data=%0d", count, q_tb);
      else
        $display($time, " PASS - Data Matched: count=%0d, actual data=%0d", count, q_tb);
      #10;
    end

    $finish;
  end
endmodule
