module logic_gates(
    input a,b,
    output and_,or_,not_a,nand_,nor_,xor_,xnor_
);

and(and_,a,b);
or(or_,a,b);
not(not_a,a);
nand(nand_,a,b);
nor(nor_,a,b);
xor(xor_,a,b);
xnor(xnor_,a,b);



endmodule