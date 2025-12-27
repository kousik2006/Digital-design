`timescale 1ns/1ps

module encoder_testbench;
reg [3:0]D;
wire [1:0]y;

encoder dut(
    .D(D),
    .y(y)
);

initial begin
    D = 4'b0001;
    $monitor("time = %t , D = %b, y = %b",$time,D,y);
    #10 D = 4'b0010;
    #10 D = 4'b0100;
    #10 D = 4'b1000;
    #10 $finish;


end
endmodule