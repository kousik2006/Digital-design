`timescale 1ns/1ps

module testbench_;

    reg a,b;
    wire or_,and_,nand_,nor_,xor_,xnor_;

    or_gate dut1(
        .a(a),
        .b(b),
        .or_(or_)
    );

    and_gate dut2(
        .a(a),
        .b(b),
        .and_(and_)     
    );

    nor_gate dut3(
        .a(a),
        .b(b),
        .nor_(nor_)
    );

    nand_gate dut4(
        .a(a),
        .b(b),
        .nand_(nand_)
    );

    xor_gate dut5(
        .a(a),
        .b(b),
        .xor_(xor_)
    );

    xnor_gate dut6(
        .a(a),
        .b(b),
        .xnor_(xnor_)
    );


initial begin

    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench_);

    a = 1'b0; b = 1'b0;
    #10 a = 1'b0; b = 1'b1;
    #10 a = 1'b1; b = 1'b0;
    #10 a = 1'b1; b = 1'b1;
    #10 $finish;

end

endmodule