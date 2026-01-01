`timescale 1ns/1ps

module test_bench;

    reg a;
    wire out;
    switch_level_not dut(
        .a(a),
        .out(out)
    );

    initial begin

        $dumpfile("not_gate_testbench.vcd");
        $dumpvars(0,test_bench);

        a = 1'b0;
        #10 a = 1'b1;
        #10 a = 0;
        #10 $finish;
        
    end

endmodule