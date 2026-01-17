module  bit_1_comparator(
    input data1,
    input data2,
    input g_in,l_in,e_in,
    output g_out,l_out,e_out
);

assign g_out = g_in | (e_in & (data1 & ~data2));
assign l_out = l_in | (e_in & (~data1 & data2));
assign e_out = e_in & ~(data1 ^ data2);

endmodule

module bit_3_comparator(
    input [2:0] data1,
    input [2:0] data2,
    output smaller,greater,equal
);

    wire g1,g2,l1,l2,e1,e2;

    bit_1_comparator MSB(
        .g_in(1'b0),
        .l_in(1'b0),
        .e_in(1'b1),
        .data1(data1[2]),
        .data2(data2[2]),
        .g_out(g1),
        .l_out(l1),
        .e_out(e1)
    );

    bit_1_comparator Middle(
        .g_in(g1),
        .l_in(l1),
        .e_in(e1),
        .data1(data1[1]),
        .data2(data2[1]),
        .g_out(g2),
        .l_out(l2),
        .e_out(e2)
    );

        bit_1_comparator LSB(
        .g_in(g2),
        .l_in(l2),
        .e_in(e2),
        .data1(data1[0]),
        .data2(data2[0]),
        .g_out(greater),
        .l_out(smaller),
        .e_out(equal)
    );



endmodule