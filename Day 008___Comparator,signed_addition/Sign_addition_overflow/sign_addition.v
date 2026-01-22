module sign_addition #(
    parameter N = 4
)(
    input signed [N-1:0]data1,
    input signed [N-1:0]data2,
    output signed [N-1:0]sum,
    output overflow
);
assign sum = data1 + data2;
assign overflow = ~(data1[N-1] ^ data2[N-1]) & (data1[N-1] ^ sum[N-1]);
endmodule