module DataMemory (
    input wire clock,
    input wire [7:0] address,
    input wire [7:0] writeData,
    output wire [7:0] dataOut,

    input wire MemRead,
    input wire MemWrite
);

  reg [7:0] data[30:0];
  reg [7:0] current;

  always @(negedge clock) //leitura
    begin
    if (MemRead) begin
      current = data[address];
    end
  end

  always @(posedge clock) //escrita
    begin
    if (MemWrite) begin
      data[address] = writeData;
    end
  end

  assign dataOut = current;

endmodule
