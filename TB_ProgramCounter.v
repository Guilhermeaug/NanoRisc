module ProgramCounterTestbench;

  reg clock;
  reg [7:0] in;
  wire [7:0] out;
  reg PCWrite;

  ProgramCounter dut (
      clock,
      in,
      out,
      PCWrite
  );

  initial begin
    // inicializando os parametros
    clock = 0;
    in = 0;
    PCWrite = 0;

    $display("Teste 1: Escrevendo o valor 1 no PC");
    in = 1;
    PCWrite = 1;
    #1 clock = 1;
    #1 clock = 0;
    in = 0;

    $display("Teste 2: Escrevendo o valor 2 no PC");
    // programCounter = 2
    in = 2;
    PCWrite = 1;
    #1 clock = 1;
    #1 clock = 0;
    in = 0;

    $display("Teste 3: Tentando escrever um valor em PC com o bit de escrita desligado");
    in = 8;
    PCWrite = 0;
    #1 clock = 1;
    #1 clock = 0;
    in = 0;

    $display("Teste 4: Escrevendo o valor 3 no PC");
    in = 3;
    PCWrite = 1;
    #1 clock = 1;
    #1 clock = 0;
    in = 0;

  end

  initial begin
    $monitor("Time=%0d, Clock=%b, PCWrite=%d, in=%d, out=%d ", $time, clock, PCWrite, in, out);
  end

endmodule
