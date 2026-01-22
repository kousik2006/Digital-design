module binary_to_gray #(
    parameter N = 4
)(
    input [N-1:0] binary,
    output [N-1:0] gray
);

genvar i;

// MSB bits remain same
assign gray[N-1] = binary [N-1];

generate
    for (i=0; i<N-1; i = i + 1) begin
    assign gray[i] = binary[i] ^ binary[i+1];
    end
endgenerate

endmodule


