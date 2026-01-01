`timescale 1ns/1ps

module half_adder(
    input a,b,
    output sum, carry
);

wire t1,t2,t3;

nor g1(t1,a,a);
nor g2(t2,b,b);
nor CARRY(carry,t1,t2);
nor g3(t3,a,b);
nor SUM(sum,t3,carry);

endmodule