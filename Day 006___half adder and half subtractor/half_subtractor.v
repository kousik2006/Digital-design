`timescale 1ns/1ps

module half_subtractor(
    input a,b,
    output borrow, diff
);
    assign diff = a ^ b;
    assign borrow = (~a) & b;
endmodule