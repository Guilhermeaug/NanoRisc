module ControlUnit (
    input wire [2:0] opcode,
    output reg PCWrite,
    output reg RegWrite,
    output reg isSend,
    output reg isBranch,
    output reg [1:0] ULAOp,
    output reg MemWrite,
    output reg MemRead,
    output reg RegMemWrite
);

  initial begin
    PCWrite = 1;
  end

  always @(opcode) begin
    case (opcode)
      3'b000: begin  // sum
        PCWrite = 1;
        isBranch = 0;
        ULAOp = 2'b00;
        MemWrite = 0;
        MemRead = 0;
        RegMemWrite = 0;
        RegWrite = 1;
        isSend = 0;
      end
      3'b001: begin  // sub
        PCWrite = 1;
        isBranch = 0;
        ULAOp = 2'b01;
        MemWrite = 0;
        MemRead = 0;
        RegMemWrite = 0;
        RegWrite = 1;
        isSend = 0;
      end
      3'b010: begin  // mul
        PCWrite = 1;
        isBranch = 0;
        ULAOp = 2'b10;
        MemWrite = 0;
        MemRead = 0;
        RegMemWrite = 0;
        RegWrite = 1;
        isSend = 0;
      end
      3'b011: begin  // lwi
        PCWrite = 1;
        isBranch = 0;
        ULAOp = 2'bxx;
        MemWrite = 0;
        MemRead = 1;
        RegMemWrite = 1;
        RegWrite = 0;
        isSend = 0;
      end
      3'b100: begin  // swi
        PCWrite = 1;
        isBranch = 0;
        ULAOp = 2'bxx;
        MemWrite = 1;
        MemRead = 0;
        RegMemWrite = 0;
        RegWrite = 0;
        isSend = 0;
      end
      3'b101: begin  // bne
        PCWrite = 1;
        isBranch = 1;
        ULAOp = 2'b01;
        MemWrite = 0;
        MemRead = 0;
        RegMemWrite = 0;
        RegWrite = 0;
        isSend = 0;
      end
      3'b110: begin  // halt
        PCWrite = 0;
        isBranch = 0;
        ULAOp = 2'b00;
        MemWrite = 0;
        MemRead = 0;
        RegMemWrite = 0;
        RegWrite = 0;
        isSend = 0;
      end
      3'b111: begin  // send
        PCWrite = 1;
        isBranch = 0;
        ULAOp = 2'bxx;
        MemWrite = 0;
        MemRead = 0;
        RegMemWrite = 0;
        RegWrite = 1;
        isSend = 1;
      end
    endcase
  end

endmodule
