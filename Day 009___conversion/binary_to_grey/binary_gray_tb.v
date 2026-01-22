`timescale 1ns/1ps

module binary_to_gray_tb;

parameter P = 4;
reg [P-1:0] binary;
wire [P-1:0] gray;
binary_to_gray #(.N(P)) dut (
    .binary(binary),
    .gray(gray)
);
integer  i;
initial begin
    $monitor ("binary = %b -> gray = %b",binary,gray);
    for (i=0; i< (1<<P); i = i +1) begin
        binary = i;
        #10;
    end
    $finish;
end
endmodule