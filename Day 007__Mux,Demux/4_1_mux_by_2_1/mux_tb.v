`timescale 1ns/1ps

module mux_4_1_tb;

reg [3:0]data;
reg [1:0]select;
wire result;

mux_4_1 dut(
    .data(data),
    .select(select),
    .result(result)
);

integer i;

initial begin
    data = 4'b0101;
    select = {2{1'b0}};

    $monitor("time = %t, data = %b, select = %b, result = %b",$time,data,select,result);

    for(i=0; i<4; i=i+1) begin
        select = i[1:0];
        #10;
    end
    $finish;
end
endmodule
