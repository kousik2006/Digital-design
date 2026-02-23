module ringcounter #(
    parameter N = 4
)(
    input  wire clk,
    input  wire reset,
    input  wire enable,
    output reg  [N-1:0] q
);

always @(posedge clk) begin
    if (reset)
        q <= { {(N-1){1'b0}}, 1'b1 };
    else if (enable)
        q <= { q[N-2:0], q[N-1] };
end

endmodule
