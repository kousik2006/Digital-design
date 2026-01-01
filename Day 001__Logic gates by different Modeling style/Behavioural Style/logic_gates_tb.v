`timescale 1ns/1ps

module test_bench;
    reg a,b;
    wire and_,
        or_,
        nor_,
        nand_,
        not_a,
        xor_,
        xnor_;

    //instantiation of past module
    logic_gates dut(a,b,and_,or_,not_a,nand_,nor_,xor_,xnor_);

    initial begin
        $dumpfile("test_bench.vcd");
        $dumpvars(0,test_bench);


        a = 1'b0; b = 1'b0;
        #10 a = 1'b1; b = 1'b0;
        #10 a = 1'b0; b = 1'b1;
        #10 a = 1'b1; b = 1'b1;
        #10 $finish;
    end




endmodule