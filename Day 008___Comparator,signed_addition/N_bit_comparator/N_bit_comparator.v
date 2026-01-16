module comparator #(parameter N = 3)(
    input [N-1:0]data1,
    input [N-1:0]data2,
    output wire greater,equal,smaller
);

assign greater = (data1>data2);
assign smaller = (data1<data2);
assign equal = (data1 == data2);
endmodule