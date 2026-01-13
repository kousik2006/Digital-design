module mux_N_1 #(
    parameter N = 4
) (
    input wire [N-1:0]Data,
    input wire[$clog2(N)-1:0]select,
    output out
)
assign out = Data[select]
endmodule

module mux_N2_1 #(parameter N)(
       input reg data[15:0];
       output wire result;
       input select 
)
endmodule