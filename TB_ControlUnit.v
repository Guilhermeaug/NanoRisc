module ControlUnitTestbench;

  reg [2:0] opcode;
  wire PCWrite;
  wire RegWrite;
  wire isSend;
  wire isBranch;
  wire [1:0] ULAOp;
  wire MemWrite;
  wire MemRead;
  wire RegMemWrite;

  ControlUnit dut (
      opcode,
      PCWrite,
      RegWrite,
      isSend,
      isBranch,
      ULAOp,
      MemWrite,
      MemRead,
      RegMemWrite
  );
  
  initial begin
    $display("Teste 1: Verificando os sinais de controle da instrucao MUL");
    opcode = 3'b010;

    #1 $display("Teste 2: Verificando os sinais de controle da instrucao SEND");
    opcode = 3'b111;
  end

  initial begin
    $monitor("Time = %d, opcode = %d, PCWrite = %d, RegWrite = %d, isSend = %d, isBranch = %d, ULAOp = %d, MemWrite = %d, MemRead = %d, RegMemWrite = %d", $time, opcode, PCWrite, RegWrite, isSend, isBranch, ULAOp, MemWrite, MemRead, RegMemWrite);
  end


endmodule
