`include "And.v"

module AndTestbench;
  reg  in1;
  reg  in2;
  wire out;

  And dut (
      .out(out),
      .in1(in1),
      .in2(in2)
  );

  initial begin
    $display("Teste 1: in1=0, in2=0");
    in1 = 0;
    in2 = 0;

    #1 $display("Teste 2: in1=0, in2=1");
    in1 = 0;
    in2 = 1;

    #1 $display("Teste 3: in1=1, in2=0");
    in1 = 1;
    in2 = 0;

    #1 $display("Teste 4: in1=1, in2=1");
    in1 = 1;
    in2 = 1;
  end

  initial begin
    $monitor("Tempo :%0d\tEntrada 1: %b\tEntrada 2: %b\tSaida: %b\n", $time, in1, in2, out);
  end

endmodule
