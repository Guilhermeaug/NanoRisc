module Adder (
    input  wire [7:0] in,
    output wire [7:0] out
);

  assign out = in + 1;

endmodule
