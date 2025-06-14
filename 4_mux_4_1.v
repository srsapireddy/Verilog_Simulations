// 4-to-1 mux : RTL
module mux4_1(Z, A, B, C, D, sel);
  output Z;
  input A, B, C, D;
  input [1:0] sel;

  reg out;

  assign Z = out;

  always @(A or B or C or D or sel)
  begin
    if (sel == 0)
      out = A;
    else if (sel == 1)
      out = B;
    else if (sel == 2)
      out = C;
    else
      out = D;
  end
endmodule
