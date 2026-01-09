module decoder #(
    parameter N = 3
) (
    input wire [N-1:0]y,
    input wire enable,
    output wire [(1<<N)-1:0]D
);

    assign D = (enable) ? (1<<y) : {(1<<N){1'b0}};

endmodule
