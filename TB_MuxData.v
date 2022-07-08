`include "Mux.v"

module MuxTestbenchData;
  reg [7:0] in1;
  reg [7:0] in2;
  reg control;
  wire [7:0] out;

  Mux #(
      .N(8)
  ) dut (
      .in1(in1),
      .in2(in2),
      .control(control),
      .out(out)
  );

  initial begin
    $display("Teste 1: Selecionando a entrada 1");
    in1 = 22;
    in2 = 14;
    control = 0;

    #1; $display("Teste 2: Selecionando a entrada 2");
    in1 = 70;
    in2 = 17;
    control = 1;
  end

  initial begin
    $monitor("Tempo: %0d\tEntrada 1: %d\tEntrada 2: %d\tControle: %b\tSaida: %d\n", $time, in1,
             in2, control, out);
  end

endmodule
