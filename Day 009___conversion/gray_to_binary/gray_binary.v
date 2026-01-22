module gray_to_binary  #(
    parameter N = 4
)(
    input [N-1:0] gray,
    output [N-1:0] binary
);

genvar i;

// MSB bits remain same
assign binary[N-1] = gray [N-1];

generate
    for (i=0; i< N-1; i = i+1) begin
    assign binary[i] = gray[i] ^ binary[i+1];
    end
endgenerate

endmodule

