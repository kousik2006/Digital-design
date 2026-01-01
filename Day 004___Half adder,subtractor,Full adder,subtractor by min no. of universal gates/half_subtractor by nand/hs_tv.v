`timescale 1ns/1ps

module half_subtractor_tb;

    reg a,b;
    wire diff,borrow;


    half_subtractor dut(
        .a(a),
        .b(b),
        .diff(diff),
        .borrow(borrow)
    );

    initial begin
        $dumpfile("half_subtractor_tb.vcd");
        $dumpvars(0,half_subtractor_tb);

        $monitor("time = %t, a = %b, b = %b, diff = %b, borrow = %b",$time,a,b,diff,borrow);

        a = 1'b0; b = 1'b0;
        #10 a = 1'b0; b = 1'b1;
        #10 a = 1'b1; b = 1'b0;
        #10 a = 1'b1; b = 1'b1;
        #10 $finish;

    end

endmodule
