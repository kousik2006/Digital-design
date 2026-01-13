module mux_2_p_1 #(
    parameter P = 2
    )(
        input [(1<<P)-1:0] data,
        input [P-1:0] select,
        output result
    );

    assign result = data[select];

endmodule