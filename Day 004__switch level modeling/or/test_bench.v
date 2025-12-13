`timescale 1ns/1ps

module test_bench;

    reg a,b;
    wire out;
    or_gate dut(
        .a(a),
        .b(b),
        .out(out)
    );

   
    initial begin

        $dumpfile("and_testbench.vcd");
        $dumpvars(0,test_bench);

        a = 1'b0; b = 1'b0;
        #10 a = 1'b1; b = 1'b0;
        #10 a = 1'b0; b = 1'b1;
        #10 a = 1'b1; b = 1'b1;
        #10 $finish;
        
    end

endmodule