module RegistersBank (
    input wire clock,
    input wire [1:0] readReg1,
    input wire [1:0] readReg2,
    input wire [1:0] readReg3,
    input wire [1:0] writeReg,
    input wire [7:0] writeData,
    input wire [7:0] memWrite,

    output wire [7:0] data1,
    output wire [7:0] data2,
    output wire [7:0] data3,
    output wire [7:0] memRead,
    output wire [7:0] raRead,

    // sinais de controle
    input wire RegWrite,
    input wire RegMemWrite,
    input wire isSendType0
);

  reg [7:0] registersA[3:0];  // registradores $zero, $mem, $t0, $t1
  reg [7:0] registersB[3:0];  // registradores $t2, $t3, $t4, $ra

  always @(posedge clock) //escrita
    begin

    if (RegWrite) begin
      if (isSendType0) begin
        registersB[writeReg] = writeData;
      end else begin
        registersA[writeReg] = writeData;
      end
    end

    if (RegMemWrite) begin
      registersA[1] = memWrite;
    end
  end

  initial begin
    registersA[0] = 0; // $zero
  end

  assign data1   = registersA[readReg1];
  assign data2   = registersA[readReg2];
  assign data3   = registersB[readReg3];
  assign memRead = registersA[1];
  assign raRead  = registersB[3];

endmodule