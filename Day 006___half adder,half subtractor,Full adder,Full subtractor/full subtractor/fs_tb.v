`timescale 1ns/1ps

module full_subtractor_tb;

    reg a,b,borrow_in;
    wire diff,borrow_out;

    full_subtractor dut(
        .a(a),
        .b(b),
        .borrow_in(borrow_in),
        .diff(diff),
        .borrow_out(borrow_out)
    );

    integer i;

    initial begin

        $dumpfile("full_subtractor_tb.vcd");
        $dumpvars(0,full_subtractor_tb);

        // This will print the all changes
        $monitor("At time %t, a = %b, b = %b, borrow_in = %b, diff = %b, borrow_out = %b",$time,a,b,borrow_in,diff,borrow_out);

        for(i = 0; i<8; i = i+1) begin
            {a,b,borrow_in} = i[2:0]; // blocking assignment
            #10;
       end
       $finish;


    end
endmodule

