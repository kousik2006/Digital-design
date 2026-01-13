`timescale 1ns/1ps

module mux_testbench;


parameter N = 2;
localparam M = 1<<N;

reg [M-1:0] data;
reg [N-1:0] select;
wire result;
integer  i;

mux_2_p_1 #(.P(N)) dut(
    .data(data),
    .select(select),
    .result(result)
);

initial begin
    data = $random & ((1<<M)-1);
    select = {N{1'b0}};
    $monitor("time = %t, data = %b, select = %b, result = %b",$time,data,select,result);

    for (i=0; i<M; i=i+1) begin
        select = i[N-1:0];
        #10;
    end
    $finish;
end
endmodule

