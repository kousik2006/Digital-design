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
    for (i=N-2; i>=0; i = i-1) begin
    assign gray[i] = binary[i] ^ binary[i+1];
    end
endgenerate

endmodule


/* integer i;

// MSB bits remain same
assign gray[N-1] = binary [N-1];

always @(*)
    for (i=N-2; i>=0; i = i-1) begin
    assign gray[i] = binary[i] ^ binary[i+1];
    end */
