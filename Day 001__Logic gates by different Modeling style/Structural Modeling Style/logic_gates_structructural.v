module logic_gates(
    input  a,b,
    output and_,or_,not_a,nand_,nor_,xor_,xnor_
);


    assign    not_a = ~a;
    assign    and_ = a&b;
    assign    or_ = a|b;
    assign    nand_ = ~(a&b);
    assign    nor_ = ~(a|b);
    assign   xor_ = a^b;
    assign    xnor_ = ~(a^b);
    

endmodule
