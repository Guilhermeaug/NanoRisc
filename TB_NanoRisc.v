`include "NanoRisc.v"
`include "InstructionMemory.v"
`include "DataMemory.v"

module NanoRiscTestbench;
  reg clock;

  wire [7:0] instructionFromInstructionMemory;
  wire [7:0] instructionAddressToInstructionMemory;

  wire [7:0] dataFromDataMemory;
  wire [3:0] addressToDataMemory;
  wire [7:0] dataToDataMemory;

  reg [15:0] cycleCounter;
  integer i;

  NanoRisc nRisc (
      clock,
      instructionFromInstructionMemory,
      dataFromDataMemory,
      instructionAddressToInstructionMemory,
      addressToDataMemory,
      dataToDataMemory
  );

  InstructionMemory instructionMemory (
      clock,
      instructionAddressToInstructionMemory,
      instructionFromInstructionMemory
  );

  DataMemory dataMemory (
      clock,
      addressToDataMemory,
      dataToDataMemory,
      dataFromDataMemory,
      nRisc.MemRead,
      nRisc.MemWrite
  );

  initial begin
    clock = 0;
    cycleCounter = 1;

    forever begin
      if (cycleCounter == 70) begin
        $finish;
      end

      #1;
      clock = ~clock;

      $display("Program Counter: %d", nRisc.programCounter.progamCounter);
      $display("PCin: %d", nRisc.PCin);
      $display("Numero de ciclos: %d", cycleCounter);
      $display("Clock: %b", clock);
      $display("Instrucao completa: %b", nRisc.instructionFromInstructionMemory);
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
      $display("$mem: %b", nRisc.memRead);

      for (i = 0; i < 4; i++) begin
        $display("Registrador A -> %d: %b => %d", i, nRisc.registerBank.registersA[i],
                 nRisc.registerBank.registersA[i]);
      end

      for (i = 0; i < 4; i++) begin
        $display("Registrador B -> %d: %b", i, nRisc.registerBank.registersB[i]);
      end

      $display("\n");

      cycleCounter = cycleCounter + 1;
    end
  end

endmodule
