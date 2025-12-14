`timescale 1ns/1ps

module half_adder_tb;

    reg a,b,clk;
    wire sum,carry;

    initial clk = 1'b0;
    always #5 clk = ~clk;

    half_adder dut(
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $dumpfile("half_adder_tb.vcd");
        $dumpvars(0,half_adder_tb);

        a = 1'b0; b = 1'b0;
        #10 a = 1'b0; b = 1'b1;
        #10 a = 1'b1; b = 1'b0;
        #10 a = 1'b1; b = 1'b1;
        #10 $finish;

    end

    always @(posedge clk) begin
        $display ("a = %b , b = %b, sum = %b, carry = %b",a,b,sum,carry);

    end

    


endmodule