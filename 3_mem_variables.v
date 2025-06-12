// memory variables program
module mem_variables;

  reg [7:0] mem_01;           // reg vector 8-bit wide
  reg [7:0] mem_02 [0:3];     // 8-bit wide vector array with depth=4
  reg [15:0] mem_03 [0:3][0:1]; // 16-bit wide vector 2D array with rows=4, cols=2

  initial begin
    integer row, column;

    mem_01 = 8'hca;
    $display("mem_01 = %0h", mem_01);

    mem_02[0] = 8'h11;
    mem_02[1] = 8'h22;
    mem_02[2] = 8'h33;
    mem_02[3] = 8'h44;

    for (row = 0; row < 4; row = row + 1) begin
      $display("mem_02[%0d] = 0x%0h", row, mem_02[row]);
    end

    for (row = 0; row < 4; row = row + 1) begin
      for (column = 0; column < 2; column = column + 1) begin
        mem_03[row][column] = row + column;
        $display("mem_03[%0d][%0d] = 0x%0h", row, column, mem_03[row][column]);
      end
    end
  end

endmodule
