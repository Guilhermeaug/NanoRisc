`include "Adder.v"
`include "And.v"
`include "ControlUnit.v"
`include "Mux.v"
`include "ProgramCounter.v"
`include "RegistersBank.v"
`include "ULA.v"

module NanoRisc (
    input wire clock,
    input wire [7:0] instructionFromInstructionMemory,
    input wire [7:0] dataFromDataMemory,
    output wire [7:0] instructionAddressToInstructionMemory,
    output wire [3:0] addressToDataMemory,
    output wire [7:0] dataToDataMemory
);

  // Instrucao decodificada
  wire [2:0] opcode = instructionFromInstructionMemory[7:5];
  wire [1:0] reg1 = instructionFromInstructionMemory[4:3];
  wire [1:0] reg2 = instructionFromInstructionMemory[2:1];
  wire [4:0] address = instructionFromInstructionMemory[4:0];
  wire bitZero = instructionFromInstructionMemory[0];

  // Program Counter
  wire [7:0] PCin;
  wire [7:0] PCout;

  // Control Unit
  wire [1:0] ULAOp;
  wire PCWrite, RegWrite, isSend, isBranch, MemWrite, MemRead, RegMemWrite;

  // Banco de Registradores
  wire [7:0] data1, data2, data3, memRead, raRead;

  // ULA
  wire [7:0] ulaResult;
  wire ulaZero;

  // Saida dos ANDS
  wire andRegisterWrite, andIsSendType0, andForBranch;

  // Saida dos MUXS
  wire [1:0] selectedForWrite;
  wire [7:0] selectedData, selectedSend, writeData;

  // Adder
  wire [7:0] PCoutPlus1;    

  ProgramCounter programCounter (
      clock,
      PCin,
      PCout,
      PCWrite
  );

  Adder adder (
      PCout,
      PCoutPlus1
  );

  ControlUnit controlUnit (
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

  And andForRegisterWrite (
      ~bitZero,
      isSend,
      andRegisterWrite
  );
  
  Mux #(
      .N(2)
  ) muxForRegisterWrite (
      reg1,
      reg2,
      andRegisterWrite,
      selectedForWrite
  );

  And andForSendType0 (
      isSend,
      ~bitZero,
      andIsSendType0
  );

  RegistersBank registerBank (
      clock,
      reg1,
      reg2,
      reg2,
      selectedForWrite,
      writeData,
      dataFromDataMemory,
      data1,
      data2,
      data3,
      memRead,
      raRead,
      RegWrite,
      RegMemWrite,
      andIsSendType0
  );

  ULA ula (
      selectedData,
      data2,
      ulaZero,
      ulaResult,
      ULAOp
  );

  And andForBranchSelection (
      ~ulaZero,
      isBranch,
      andForBranch
  );

  Mux #(
      .N(8)
  ) muxForData (
      data1,
      data2,
      bitZero,
      selectedData
  );

  Mux #(
      .N(8)
  ) muxForSend (
      data1,
      data3,
      bitZero,
      selectedSend
  );

  Mux #(
      .N(8)
  ) muxForWriteData (
      ulaResult,
      selectedSend,
      isSend,
      writeData
  );

  Mux #(
      .N(8)
  ) muxForNextInstruction (
      PCoutPlus1,
      raRead,
      andForBranch,
      PCin
  );

  assign instructionAddressToInstructionMemory = PCout;
  assign addressToDataMemory = address;
  assign dataToDataMemory = memRead;

endmodule
