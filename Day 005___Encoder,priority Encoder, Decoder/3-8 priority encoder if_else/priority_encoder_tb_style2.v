`timescale 1ns/1ps
module priority_encoder_tb;

wire [2:0]y;
reg [7:0]D;
wire valid;

priority_encoder dut(
    .y(y),
    .D(D),
    .valid(valid)
);

initial begin
    $monitor("time = %t, D = %b, output = %b, valid = %b",$time,D,y,valid);
    repeat(21)
    begin
        D = $random;
        #10;
    end
    $finish;
end
endmodule