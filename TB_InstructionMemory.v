module InstructionMemoryTestbench;

  reg clock;
  reg [7:0] in;
  wire [7:0] out;

  InstructionMemory dut (
      clock,
      in,
      out
  );

  initial begin
    clock = 1;
    in = 0;

    $display("Teste 1: Buscando a intrucao 0");
    in = 0;
    #1 clock = 0;
    #1 clock = 1;
    in = 0;

    $display("Teste 2: Buscando a instrucao 1");
    in = 1;
    #1 clock = 0;
    #1 clock = 1;
    in = 0;

    $display("Teste 3: Buscando a instrucao 2");  
    in = 2;
    #1 clock = 0;
    #1 clock = 1;
    in = 0;

    $display("Teste 4: Buscando a instrucao 3");
    in = 3;
    #1 clock = 0;
    #1 clock = 1;
    in = 0;

  end

  initial begin
    $monitor("Time=%0d, Clock=%b, in=%d, out=%b ", $time, clock, in, out);
  end

endmodule
