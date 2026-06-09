module alu_4bit_structural(
    input wire [3:0] A,
    input wire [3:0] B,
    input wire [1:0] control,
    output wire [3:0] result,
    output wire carry_out
);

wire [3:0] B_modified;
wire [3:0] and_result;
wire [3:0] add_sub_result;

wire subtract;

assign subtract = control[0];

xor_subtractor_block XOR_BLOCK(
    .B(B),
    .Sub(subtract),
    .B_out(B_modified)
);

and_block AND_BLOCK(
    .A(A),
    .B(B),
    .Y(and_result)
);

ripple_carry_adder_4bit RCA(
    .A(A),
    .B(B_modified),
    .Cin(subtract),
    .Sum(add_sub_result),
    .Cout(carry_out)
);

mux2to1_4bit RESULT_MUX(
    .D0(and_result),
    .D1(add_sub_result),
    .Sel(control[1]),
    .Y(result)
);

endmodule
