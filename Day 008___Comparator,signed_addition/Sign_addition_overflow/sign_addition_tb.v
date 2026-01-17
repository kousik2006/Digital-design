`timescale 1ns/1ps
module sign_addition_tb;
parameter P = 4;
reg signed [P-1:0]data1;
reg signed [P-1:0]data2;
wire [P-1:0]sum;
wire overflow;

sign_addition #(.N(P)) dut (
    .data1(data1),
    .data2(data2),
    .sum(sum),
    .overflow(overflow)
);

initial begin
    $monitor("time = %t, data1 = %0d, data2 = %0d, sum = %0d, overflow = %0d",$time,$signed(data1),$signed(data2),$signed(sum),overflow);
    data1 = 4'b1001;
    data2 = 4'b1010;
    #10    
    data1 = 4'b1101;
    data2 = 4'b1110;
    #10 
    data1 = 4'b0101;
    data2 = 4'b0110;
    #10 
    data1 = 4'b1001;
    data2 = 4'b0010;
    #10
    $finish;
end

endmodule
