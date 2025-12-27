`timescale 1ns/1ps

module half_adder(
    input a,b,
    output sum, carry
);

wire t1,t2,t3;

nand g1(t1,a,b);
nand g2(t2,a,t1);
nand g3(t3,t1,b);
nand SUM(sum,t2,t3);
nand CARRY(carry,t1,t1);

endmodule