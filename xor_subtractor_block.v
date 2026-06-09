module xor_subtractor_block(
    input wire [3:0] B,
    input wire Sub,
    output wire [3:0] B_out
);

assign B_out = B ^ {4{Sub}};

endmodule
