`timescale 1ns/1ps

module full_adder(
    input a,b,carry_in,
    output sum,carry_out
);

    assign sum = a ^ b ^ carry_in;
    assign carry_out = (a & b) | (carry_in & (a ^ b));

endmodule
