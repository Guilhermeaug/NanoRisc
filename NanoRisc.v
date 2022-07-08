`include "Adder.v"
`include "And.v"
`include "ControlUnit.v"
`include "DataMemory.v"
`include "Mux.v"
`include "ProgramCounter.v"
`include "RegistersBank.v"
`include "ULA.v"

module NanoRisc (
    input wire clock,
    input wire [7:0] instructionFromInstructionMemory,
    output wire [7:0] instructionAddressToInstructionMemory
);
  // Program Counter
  reg [7:0] PCin;
  wire [7:0] PCout;

  wire [2:0] opcode = instructionFromInstructionMemory[7:5];
  wire [1:0] reg1 = instructionFromInstructionMemory[4:3];
  wire [1:0] reg2 = instructionFromInstructionMemory[2:1];
  wire [4:0] address = instructionFromInstructionMemory[4:0];
  wire bitZero = instructionFromInstructionMemory[0];

  // Control Unit
  wire [1:0] ULAOp;
  wire PCWrite, RegWrite, isSend, isBranch, MemWrite, MemRead, RegMemWrite;

  // Saida dos ANDS
  wire andRegisterWrite;

  // Saida dos MUXS
  wire [1:0] selectedForWrite;

  ProgramCounter programCounter (
      clock,
      PCin,
      PCout,
      PCWrite
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


  assign instructionAddressToInstructionMemory = PCout;

endmodule
