`include "NanoRisc.v"
`include "InstructionMemory.v"

module NanoRiscTestbench;
  reg clock;
  wire [7:0] instructionFromInstructionMemory;
  wire [7:0] instructionAddressToInstructionMemory;

  reg [15:0] cycleCounter;

  NanoRisc nRisc (
      clock,
      instructionFromInstructionMemory,
      instructionAddressToInstructionMemory
  );

  InstructionMemory instructionMemory (
      clock,
      instructionAddressToInstructionMemory,
      instructionFromInstructionMemory
  );

  initial begin
    clock = 1;
    cycleCounter = 1;
    nRisc.PCin = 0;
    #1 clock = 0;
    #1 clock = 1;
    #1;
    $display("oi: %d\n", nRisc.PCin);
    $display("Numero de ciclos: %d", cycleCounter);
    $display("Clock: %b", clock);
    $display("Instrução completa: %b", nRisc.instructionFromInstructionMemory);
    $display("Opcode: %b", nRisc.opcode);
    $display("Reg1: %b", nRisc.reg1);
    $display("Reg2: %b", nRisc.reg2);
    $display("Endereco: %b", nRisc.address);
    $display("Bit Zero: %b", nRisc.bitZero);
    $display("Sinais de Controle");
    $display(
        "PCWrite: %b\tRegWrite: %b\tisSend: %b\tisBranch: %b\tULAOp: %b\tMemWrite: %b\tMemRead: %b\tRegMemWrite: %b",
        nRisc.PCWrite, nRisc.RegWrite, nRisc.isSend, nRisc.isBranch, nRisc.ULAOp, nRisc.MemWrite,
        nRisc.MemRead, nRisc.RegMemWrite);
    $display("Saidas das Portas AND");
    $display("Seleciona o registrador de escrita: %b", nRisc.andRegisterWrite);
    $display("Saidas dos MUXS");
    $display("Seleciona o registrador de escrita: %b", nRisc.selectedForWrite);

    /*forever begin
      #1 clock = ~clock;
    end*/
  end

  /*initial begin
    $display("NanoRiscTestbench");
    forever begin
      $display("Numero de ciclos: %d\n", cycleCounter);
      $display("Instrução completa: %b\n", nRisc.instructionFromInstructionMemory);
      $display("Opcode: %b\n", nRisc.opcode);
      $display("Reg1: %b\n", nRisc.reg1);
      $display("Reg2: %b\n", nRisc.reg2);
      $display("Endereco: %b\n", nRisc.address);
      $display("Bit Zero: %b\n", nRisc.bitZero);
    end
  end*/


endmodule
