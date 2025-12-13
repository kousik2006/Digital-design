`timescale 1ns/1ps

module test_bench;

    reg a,b;
    wire y;
    nor_gate dut(
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin

        $dumpfile("nor_gate_testbench.vcd");
        $dumpvars(0,test_bench);

        a = 1'b0; b = 1'b0;
        #10 a = 1'b1; b = 1'b0;
        #10 a = 1'b0; b = 1'b1;
        #10 a = 1'b1; b = 1'b1;
        #10 $finish;
        
    end

endmodule