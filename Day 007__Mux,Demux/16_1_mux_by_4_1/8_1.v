module mux_N_1 #(
    parameter N = 4
) (
    input wire [N-1:0]Data,
    input wire[$clog2(N)-1:0]select,
    output out
)
assign out = Data[select]
endmodule