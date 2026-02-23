`timescale 1ns/1ps

module ringcounter_tb;

parameter N = 4;
parameter CLK_PERIOD = 10;

reg clk;
reg reset;
reg enable;
wire [N-1:0] q;

ringcounter #(
    .N(N)
) dut (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .q(q)
);

/////////////////////////
// Clock generation
/////////////////////////
initial begin
    clk = 0;
    forever #(CLK_PERIOD/2) clk = ~clk;
end

/////////////////////////
// Monitor
/////////////////////////
initial begin
    $monitor("Time=%0t | reset=%b enable=%b q=%b",
              $time, reset, enable, q);
end

/////////////////////////
// Stimulus
/////////////////////////
initial begin

    // Apply reset
    reset  = 1;
    enable = 0;
    repeat(2) @(posedge clk);
    reset = 0;

    // Enable rotation
    enable = 1;
    repeat(8) @(posedge clk);

    // Disable (hold state)
    enable = 0;
    repeat(4) @(posedge clk);

    // Re-enable
    enable = 1;
    repeat(6) @(posedge clk);

    // Mid-operation reset
    reset = 1;
    @(posedge clk);
    reset = 0;
    repeat(4) @(posedge clk);

    $finish;
end

endmodule