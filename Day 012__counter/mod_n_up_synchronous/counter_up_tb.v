`timescale 1ns/1ps

module up_counter_tb;

parameter M = 3;
reg clk, reset, preset;
wire [M-1:0] count;


up_counter #(.N(M)) dut (
    .clk(clk),
    .reset(reset),
    .preset(preset),
    .count(count)
);

parameter clk_period = 10;

// clk generation
initial clk = 1'b0;
always #(clk_period / 2) clk = ~ clk;


initial begin
    $monitor ("time = %t, count = %b",$time,count);

    reset = 1'b1; // assert reset first
    preset = 1'b0;

    @(posedge clk); // wait for one clock cycle
    reset = 1'b0; // then it waits for zero.....

    repeat ((1<<M) + 1) @(posedge clk); 


    reset = 1'b1;
    # clk_period;

    reset = 1'b0; preset = 1'b1;
    # clk_period;

    $finish;
end

endmodule

