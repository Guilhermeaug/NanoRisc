module InstructionMemory (
    input wire clock,
    input wire [7:0] inAddress,
    output wire [7:0] outData
);

  reg [7:0] memory[255:0];
  reg [7:0] instruction;

  always @(negedge clock) //leitura
    begin
    instruction = memory[inAddress];
  end

  // nao haverá escrita na memoria, pois o codigo a ser executado será carregado previamente na memoria.
  initial begin
    $readmemb("../instructions.mem", memory, 0, 21);
  end

  assign outData = instruction;

endmodule
