`timescale 1ns/1ps

module full_adder_tb;

    reg a,b,carry_in;
    wire sum,carry_out;

    full_adder dut(
        .a(a),
        .b(b),
        .carry_in(carry_in),
        .sum(sum),
        .carry_out(carry_out)
    );

    integer i;

    initial begin

        $dumpfile("full_adder_tb.vcd");
        $dumpvars(0,full_adder_tb);

        // This will print the all changes
        $monitor("At time %t, a = %b, b = %b, carry_in = %b, sum = %b, carry_out = %b",$time,a,b,carry_in,sum,carry_out);

        for(i = 0; i<8; i = i+1) begin
            {a,b,carry_in} = i[2:0]; // blocking assignment
            #10;
       end
       $finish;


    end
endmodule