`timescale 1ns/1ps

module johnson_counter_tb;

parameter N = 3;
parameter CLK_PERIOD = 10;

reg clk;
reg reset;
reg enable;
wire [N-1:0] q;

// DUT instantiation
johnson_counter #(
    .N(N)
) dut (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .q(q)
);

////////////////////////////
// Clock Generation
////////////////////////////
initial begin
    clk = 0;
    forever #(CLK_PERIOD/2) clk = ~clk;
end

////////////////////////////
// Monitor
////////////////////////////
initial begin
    $monitor("Time=%0t | reset=%b enable=%b q=%b",
              $time, reset, enable, q);
end

////////////////////////////
// Stimulus
////////////////////////////
initial begin

    // 1. Apply reset
    reset  = 1;
    enable = 0;
    repeat(2) @(posedge clk);
    reset = 0;

    // 2. Enable counting
    enable = 1;
    repeat(12) @(posedge clk);   // more than one full 2N cycle

    // 3. Disable and hold state
    enable = 0;
    repeat(4) @(posedge clk);

    // 4. Re-enable
    enable = 1;
    repeat(6) @(posedge clk);

    // 5. Mid-operation reset
    reset = 1;
    @(posedge clk);
    reset = 0;
    repeat(8) @(posedge clk);

    $finish;
end

endmodule