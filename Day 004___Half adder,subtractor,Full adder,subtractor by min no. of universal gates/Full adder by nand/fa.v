// Full adder is self dual hence can use nor instead of nand.

module full_adder_nand(
    input a,b,carry_in,
    output sum, carry_out
);

wire t1,t2,t3,t4,t5,t6,t7;

// total 9 nand gate
nand(t1,a,b);
nand(t2,a,t1);
nand(t3,t1,b);
nand(t4,t2,t3); //t4 act as a xor b
nand(t5,carry_in,t4);
nand(t6,carry_in,t5);
nand(t7,t5,t4);
nand(sum,t6,t7);

//carry
nand(carry_out,t1,t5);
endmodule
