`timescale 1ns/1ps

module tb_mod10_up_counter;

reg clk;
reg reset;
wire [3:0] count;

mod10_up_counter uut (
    .clk(clk),
    .reset(reset),
    .count(count)
);

// Clock generation (10ns period)
always #5 clk = ~clk;

initial begin
    $dumpfile("mod10.vcd");
    $dumpvars(0, tb_mod10_up_counter);

    clk = 0;
    reset = 1;

    // hold reset for few cycles
    #20;
    reset = 0;

    // run counter
    #200;

    $finish;
end

initial begin
    $monitor("Time=%0t | Reset=%b | Count=%d", $time, reset, count);
end

endmodule

