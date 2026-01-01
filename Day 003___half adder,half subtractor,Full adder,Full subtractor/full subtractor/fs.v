`timescale 1ns/1ps

module full_subtractor(
    input a,b,borrow_in,
    output borrow_out,diff
);

    assign diff = a ^ b ^ borrow_in;
    assign borrow_out = (~a & b) | (b & borrow_in) | (~a & borrow_in);

endmodule
