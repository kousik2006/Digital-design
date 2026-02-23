`timescale 1ns/1ps

module even_parity_checker_tb;

    parameter N = 3;
    reg [N:0] data;
    reg parity_in;
    wire error;

    integer count = 30;

    even_parity_checker #(.N(N)) dut(
        .data(data),
        .parity_in(parity_in),
        .error(error)
    );

    initial begin

        $monitor("time = %t, Data = %b, parity_in = %b, error = %b",$time,data,parity_in,error);
        parity_in = 1'b0;
        repeat(count) begin
            parity_in = ~parity_in;
            data = $random & ((1<<N+1)-1); // random & mask to generate random N bit data sequence;
            // $random generates 32 bit random sequence;
            // it generates (1<<(n+1)-1) :- 111.......1 (n-bit)
            // hence by and operation we get n bit random sequence
            #5;
        end
        $finish;
    end
endmodule
