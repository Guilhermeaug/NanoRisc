module Mux #(
    parameter N = 2
) (
    input wire [N -1:0] in1,
    input wire [N -1:0] in2,
    input wire control,
    output reg [N -1:0] out
);

  always @(in1 or in2 or control) begin
    case (control)
      0: out = in1;
      1: out = in2;
    endcase
  end

endmodule
