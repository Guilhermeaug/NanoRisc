module ULA (
    input wire [7:0] A,
    input wire [7:0] B,
    output reg zero,
    output reg [7:0] result,
    input wire [1:0] ULAOp
);

  always @(A or B or ULAOp) begin
    case (ULAOp)
      2'b00:   result = A + B; // Soma (sum)
      2'b01:   result = A - B; // Subtracao (sub, bne)
      2'b10:   result = A * B; // Multiplicacao (mul)
      default: result = 0;
    endcase

    if (result == 0) begin
      zero = 1;
    end else begin
      zero = 0;
    end
  end
endmodule
