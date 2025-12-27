`timescale 1ns/1ps

module half_subtractor_tb;

    reg a,b,clk;
    wire diff,borrow;

    initial clk = 1'b0;
    always #5 clk = ~clk;

    half_subtractor dut(
        .a(a),
        .b(b),
        .diff(diff),
        .borrow(borrow)
    );

    initial begin
        $dumpfile("half_subtractor_tb.vcd");
        $dumpvars(0,half_subtractor_tb);

        a = 1'b0; b = 1'b0;
        #10 a = 1'b0; b = 1'b1;
        #10 a = 1'b1; b = 1'b0;
        #10 a = 1'b1; b = 1'b1;
        #10 $finish;

    end

    always @(posedge clk) begin
        $display ("a = %b , b = %b, diff = %b, borrow = %b",a,b,diff,borrow);

    end

    


endmodule