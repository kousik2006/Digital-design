
module mux_2_1(
    input [1:0]data,
    input select,
    output result
);
assign result = select ? data[1] : data[0];

endmodule

module mux_4_1(
    input [3:0]data,
    input [1:0]select,
    output result
);

    wire t1,t2;

    // first two stage
    mux_2_1 u1 (
        .data(data[1:0]),
        .select(select[0]),
        .result(t1)
    );
    mux_2_1 u2 (
        .data(data[3:2]),
        .select(select[0]),
        .result(t2)
    );

    // last stage
    mux_2_1 u3 (
        .data({t2,t1}),
        .select(select[1]),
        .result(result)
    );


endmodule