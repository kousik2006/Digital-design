`timescale 1ns/1ps

module odd_parity_generator_tb;

    parameter N = 7;
    reg [N:0] data;
    wire parity_bit;

    integer count = 30;

    odd_parity_generator #(.N(N)) dut(
        .data(data),
        .parity_bit(parity_bit)
    );

    initial begin

        $monitor("time = %t, Data = %b, parity_bit = %b",$time,data,parity_bit);
        data = {(N+1){1'b0}};
        repeat(count) begin
            data = $random & ((1<<(N+1))-1); // random & mask to generate random N bit data sequence;
            // $random generates 32 bit random sequence;
            // it generates (1<<(n+1)-1) :- 111.......1 (n-bit)
            // hence by and operation we get n bit random sequence
            #5;
        end
        $finish;
    end
endmodule
