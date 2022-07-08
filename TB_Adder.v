`include "Adder.v"

module AdderTestbench;

  reg  [7:0] in;
  wire [7:0] out;

  Adder dut (
      in,
      out
  );

  initial begin
    in = 0;

    $display("Teste 1: Entrada = 1");
    in = 1;

    #1 $display("Saida = %d", out);
    $display("Teste 2: Entrada = 2");
    in = 2;
  end

  initial begin
    $monitor("Tempo: %0d\tEntrada: %d\tSaida: %d\n", $time, in, out);
  end

endmodule
