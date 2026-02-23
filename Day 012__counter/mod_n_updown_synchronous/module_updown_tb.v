`timescale 1ns/1ps

module up_down_tb;

parameter p = 4;
parameter mod = 10;

reg clk;
reg reset;
reg up_down;
reg enable;

wire [p-1 : 0] count;

up_down #(
    .d(p),
    .mod(mod)
) dut (
    .clk(clk),
    .reset(reset),
    .up_down(up_down),
    .enable(enable),
    .count(count)
);

parameter clk_period = 10;


// clock generation
initial begin 
    clk = 1'b0;
    forever #(clk_period / 2) clk = ~ clk;
end


initial begin
    $monitor ("time = %t, enable = %b, reset = %b, count = %b",$time,enable,reset,count);

    
    reset = 1'b1;
    enable = 1'b1;
    up_down = 1'b1;
    repeat(2) @(posedge clk);  // hold reset for 2 cycles


    reset = 1'b0;
    repeat(mod + 1) @(posedge clk);

    up_down = 1'b0;
    repeat (mod + 1) @(posedge clk);

    enable = 1'b0;
    # (3 * clk_period);
    $finish;
end
endmodule
