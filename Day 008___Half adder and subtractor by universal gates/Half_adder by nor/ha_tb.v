`timescale 1ns/1ps

module half_adder_tb;

    reg a,b;
    wire sum,carry;


    half_adder dut(
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $dumpfile("half_adder_tb.vcd");
        $dumpvars(0,half_adder_tb);

        $monitor("time = %t, a = %b, b = %b, sum = %b, carry = %b",$time,a,b,sum,carry);

        a = 1'b0; b = 1'b0;
        #10 a = 1'b0; b = 1'b1;
        #10 a = 1'b1; b = 1'b0;
        #10 a = 1'b1; b = 1'b1;
        #10 $finish;

    end

endmodule