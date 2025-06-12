// testing blocking and non-blocking assignment
module blocking_nonblocking;
  reg [0:7] A, B, C;

  initial begin
    A = 3;
    A = A + 1; // blocking procedural assignment
    B = A + 1;
    $display($time, "  Blocking: A= %h B= %h", A, B);

    A = 8'h3; 
    B = 8'h0;
    A <= A + 1; // non-blocking procedural assignment
    B <= A + 1;
    $display($time, "  Non-blocking: A= %h B= %h", A, B);

    #1;
    $display($time, "  End of time unit: A= %h B= %h", A, B);
  end
endmodule
