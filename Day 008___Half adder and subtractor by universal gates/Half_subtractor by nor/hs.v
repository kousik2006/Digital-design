`timescale 1ns/1ps

module half_subtractor(
    input a,b,
    output diff,borrow
);

wire t1,t2,t3;

nand g1(t1,a,b);
nand g2(t2,a,t1);
nand g3(t3,t1,b);
nand DIFF(diff,t2,t3);
nand BORROW(borrow,t3,t3);

endmodule