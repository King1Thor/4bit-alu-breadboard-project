module mux2to1_4bit(
    input wire [3:0] D0,
    input wire [3:0] D1,
    input wire Sel,
    output wire [3:0] Y
);

assign Y = Sel ? D1 : D0;

endmodule
