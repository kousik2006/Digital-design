`timescale 1ns/1ps

module demux_testbench;
parameter N = 2;
localparam M = 1<<N;

reg [N-1:0]select;
reg data;
wire [M-1:0]y;

demux #(.P(N)) dut(
    .select(select),
    .data(data),
    .y(y)
);
integer i;

initial begin 
    $monitor("time = %t, data = %b, select = %b, y = %b",$time,data,select,y);
    select = {N{1'b0}};
    data = 1'b0;

    repeat (2) begin
        for(i=0; i<M; i = i+1) begin
        select = i[N-1:0];
        #10;
    end
        data = ~data;
        #10;
    end
    $finish;
end

endmodule
