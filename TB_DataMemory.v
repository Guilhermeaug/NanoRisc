module DataMemoryTestbench;

  reg clock;
  reg [7:0] address;
  reg [7:0] writeData;

  wire [7:0] dataOut;

  reg MemRead;
  reg MemWrite;

  DataMemory dut (
      clock,
      address,
      writeData,
      dataOut,
      MemRead,
      MemWrite
  );

  initial begin
    clock = 0;
    address = 0;
    writeData = 0;
    MemRead = 0;
    MemWrite = 0;

    $display("Teste 1: Escrevendo na memoria");
    $display("Supondo que $mem contem o valor 22");
    $display("Escrevendo no endereco 10 da memoria de dados");
    $display("Valor armazenado na posicao 10: %d", dut.data[10]);
    MemWrite  = 1;
    writeData = 22;
    address   = 10;
    #1 clock = 1;
    #1 clock = 0;
    $display("Valor armazenado na posicao 10: %d", dut.data[10]);

    $display("Teste 2: Lendo da memoria");
    $display("Lendo da posicao 10 da memoria de dados");
    $display("Valor armazenado na posicao 10: %d", dut.data[10]);
    MemRead = 1;
    MemWrite = 0;
    address = 10;
    #1 clock = 0;
    #1 clock = 1;
    $display("Valor da saida do banco de memoria: %d", dataOut);

  end

  initial begin
    $monitor("Time=%0d, Clock=%d, MemRead=%b, MemWrite=%b, address=%d, writeData=%d, dataOut=%d",
             $time, clock, MemRead, MemWrite, address, writeData, dataOut);
  end

endmodule
