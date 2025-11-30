module logic_gates(
    input wire a,b,
    output reg and_,or_,not_a,nand_,nor_,xor_,xnor_
);

always @(*)
    begin
        not_a = ~a;
        and_ = a&b;
        or_ = a|b;
        nand_ = ~(a&b);
        nor_ = ~(a|b);
        xor_ = a^b;
        xnor_ = ~(a^b);
    end

endmodule

