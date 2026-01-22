`timescale 1ns/1ps

module binary_2s_compliment_tb;

parameter P = 4;

reg  [P-1:0] in;      // INPUT → reg
wire [P-1:0] out;   // OUTPUT → wire

binary_2s_compliment #(.N(P)) dut (
    .in(in),
    .out(out)
);

integer i;

initial begin
    $monitor("binary = %b -> 2s-compliment = %b", in, out);

    for (i = 0; i < (1 << P); i = i + 1) begin
        in = i;      
        #10;
    end

    $finish;
end

endmodule
