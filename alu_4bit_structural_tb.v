`timescale 1ns / 1ps

module alu_4bit_structural_tb;

reg [3:0] A;
reg [3:0] B;
reg [1:0] control;

wire [3:0] result;
wire carry_out;

alu_4bit_structural DUT(
    .A(A),
    .B(B),
    .control(control),
    .result(result),
    .carry_out(carry_out)
);

initial begin

    // AND
    A = 4'b0111;
    B = 4'b1000;
    control = 2'b00;
    #10;

    // ADD
    A = 4'b1000;
    B = 4'b0101;
    control = 2'b10;
    #10;

    // SUB
    A = 4'b1000;
    B = 4'b0101;
    control = 2'b11;
    #10;

    $finish;
end

endmodule
