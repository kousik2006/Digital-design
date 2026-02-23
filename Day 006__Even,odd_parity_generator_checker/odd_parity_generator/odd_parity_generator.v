module odd_parity_generator #(
    parameter N = 3 // data width = N+1
)(
    input wire [N:0]data,
    output wire parity_bit
);

    assign parity_bit = ~ (^{data});

endmodule
