`timescale 1ns/1ps

module bcd_excess3_tb;

reg  [3:0] bcd;      // INPUT → reg
wire [3:0] excess3;   // OUTPUT → wire

bcd_to_excess3 dut (
    .bcd(bcd),
    .excess3(excess3)
);

integer i;

initial begin
    $monitor("bcd = %b -> excess3 = %b", bcd, excess3);

    for (i = 0; i < 10; i = i + 1) begin
        bcd = i;       
        #10;
    end

    $finish;
end

endmodule
