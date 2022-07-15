module ProgramCounter (
    input wire clock,
    input wire [7:0] in,
    output wire [7:0] out,
    input PCWrite
);

  reg [7:0] progamCounter;

  initial begin
    progamCounter = 0;
  end

  always @(posedge clock) //escrita
    begin
    if (PCWrite) begin
      progamCounter = in;
    end
  end 

  assign out = progamCounter;

endmodule
