module even_parity_checker #(
    parameter N = 7 // data width = N+1
)(
    input wire [N:0]data,
    input wire parity_in,
    output wire error
);

    assign error = ^({data,parity_in});

endmodule