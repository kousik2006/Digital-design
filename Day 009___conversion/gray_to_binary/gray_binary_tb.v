`timescale 1ns/1ps

module gray_to_binary_tb;

parameter P = 4;

reg  [P-1:0] gray;      // INPUT → reg
wire [P-1:0] binary;   // OUTPUT → wire

gray_to_binary #(.N(P)) dut (
    .gray(gray),
    .binary(binary)
);

integer i;

initial begin
    $monitor("gray = %b -> binary = %b", gray, binary);

    for (i = 0; i < (1 << P); i = i + 1) begin
        gray = i;       // ✅ drive INPUT ONLY
        #10;
    end

    $finish;
end

endmodule
