`timescale 1ns/1ps

module comparator_tb;
reg [2:0] data1;
reg [2:0] data2;
wire greater,smaller,equal;

bit_3_comparator dut(
    .data1(data1),
    .data2(data2),
    .greater(greater),
    .smaller(smaller),
    .equal(equal)
);

initial begin
    $monitor("time = %t, data 1 = %b, data 2 = %b, smaller = %b, greater = %b, equal = %b",$time,data1,data2,smaller,greater,equal);

    data1 = 3'b010; data2 = 3'b010; 
    #10 data1 = 3'b001; data2 = 3'b100;
    #10 data1 = 3'b100; data2 = 3'b001;
    #10 $finish;
end
endmodule
