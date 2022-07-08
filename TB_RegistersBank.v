module RegistersBankTestbench;
  reg clock;
  reg [1:0] readReg1;
  reg [1:0] readReg2;
  reg [1:0] readReg3;
  reg [1:0] writeReg;
  reg [7:0] writeData;
  reg [7:0] memWrite;

  wire [7:0] data1;
  wire [7:0] data2;
  wire [7:0] data3;
  wire [7:0] memRead;
  wire [7:0] raRead;

  // sinais de controle
  reg RegWrite;
  reg RegMemWrite;
  reg isSendType0;

  RegistersBank dut (
      clock,
      readReg1,
      readReg2,
      readReg3,
      writeReg,
      writeData,
      memWrite,
      data1,
      data2,
      data3,
      memRead,
      raRead,
      RegWrite,
      RegMemWrite,
      isSendType0
  );

  initial begin
    clock = 0;
    readReg1 = 0;
    readReg2 = 0;
    readReg3 = 0;
    writeReg = 0;
    writeData = 0;
    memWrite = 0;
    RegWrite = 0;
    RegMemWrite = 0;
    isSendType0 = 0;

    $display("Teste 1: Escrevendo em $t0");
    $display("Supondo que existe o valor 2 armazenado em $mem");
    dut.registersA[1] = 2;
    $display(
        "Dessa forma, iremos supor que chegou o valor 2 na entrada writeData do banco de registradores");
    $display("Valor de $t0 antes: %d", dut.registersA[2]);
    readReg1  = 2;
    readReg2  = 1;
    readReg3  = 1;
    writeReg  = 2;
    writeData = 'b00000010;
    RegWrite  = 1;
    #1 clock = 1;
    #1 clock = 0;
    $display("Valor de $t0 depois: %d", dut.registersA[2]);

    $display("Teste 2: Instrucao send do tipo 0");
    $display("Ainda supondo que existe o valor 2 armazenado em $mem");
    $display("Enviando o valor de $mem para $t2");
    $display("Valor de $t2 antes: %d", dut.registersB[0]);
    readReg1  = 1;
    readReg2  = 0;
    readReg3  = 0;
    writeReg  = 0;
    writeData = 'b00000010;
    RegWrite  = 1;
    isSendType0 = 1;
    #1 clock = 1;
    #1 clock = 0;
    $display("Valor de $t2 depois: %d", dut.registersB[0]);

    $display("Teste 3: Instrucao send do tipo 1");
    $display("Ainda supondo que existe o valor 2 armazenado em $mem");
    $display("Enviando o valor de $t2 para $t1");
    $display("Valor de $t1 antes: %d", dut.registersA[3]);
    readReg1  = 3;
    readReg2 = 0;
    readReg3 = 0;
    writeReg = 3;
    writeData = 'b00000010;
    RegWrite = 1;
    isSendType0 = 0;
    #1 clock = 1;
    #1 clock = 0;
    $display("Valor de $t1 depois: %d", dut.registersA[3]);
  end

  initial begin
    $monitor(
        "Time=%0d, Clock=%d, RegWrite=%b, RegMemWrite=%b, readReg1=%d, readReg2=%d, readReg3=%d, writeReg=%d, writeData=%d, memWrite=%d, data1=%d, data2=%d, data3=%d, memRead=%d",
        $time, clock, RegWrite, RegMemWrite, readReg1, readReg2, readReg3, writeReg, writeData,
        memWrite, data1, data2, data3, memRead);
  end

endmodule
