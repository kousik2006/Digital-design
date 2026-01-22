`timescale 1ns/1ps

module binary_to_gray_tb;

parameter P = 4;
reg [N-1:0] binary;
wire [N-1:0] gray;
binary_to_gray dut (
    .P(N),
    .binary(binary),
    .gray(gray)
)
integer  i;
initial begin
    $monitor ("binary = %b -> gray = %b",binary,gray);
    for (i=0; i< (1<<N); i = i +1) begin
    end
end
endmodule