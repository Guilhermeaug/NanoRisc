module ULATestbench;

  reg [7:0] A;
  reg [7:0] B;
  reg [1:0] ULAOp;
  wire zero;
  wire [7:0] result;

  ULA dut (
      A,
      B,
      zero,
      result,
      ULAOp
  );

  initial begin
    $display("Realizando a soma de A = 3 e B = 7");
    A = 3;
    B = 7;
    ULAOp = 0;
    #1;

    $display("Realizando a subtracao de A = 7 e B = 3");
    A = 7;
    B = 3;
    ULAOp = 1;
    #1;

    $display("Realizando a multiplicacao de A = 7 e B = 3");
    A = 7;
    B = 3;
    ULAOp = 2;
    #1;
  end

  initial begin
    $monitor("Time = %0d, A = %d, B = %d, ULAOp = %d, result = %d", $time, A, B, ULAOp, result);
  end

endmodule
