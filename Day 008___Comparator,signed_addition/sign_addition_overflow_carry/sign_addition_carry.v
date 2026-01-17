module sign_addition_carry #(
    parameter N = 4
)(
    input signed [N-1:0]data1,
    input signed [N-1:0]data2,
    output signed [N-1:0]sum,
    output overflow
);
wire signed [N:0]full_sum;
assign full_sum = data1 + data2;
assign sum = full_sum[N-1:0];

// overflow occurs when carry_in MSB and carry_out MSb are different
assign overflow = full_sum[N] ^ full_sum[N-1];
endmodule
