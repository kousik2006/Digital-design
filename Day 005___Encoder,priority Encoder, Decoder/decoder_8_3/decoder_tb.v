`timescale 1ns/1ps
module decoder_tb;

parameter N = 3;

wire [(1<<N)-1:0]D;
reg enable;
reg [N-1:0]y;
integer i;

decoder #(.N(N)) dut (
    .D(D),
    .enable(enable),
    .y(y)
);

    initial begin
        $monitor ("time = %t, enable = %b, y = %b, D = %b",$time,enable,y,D);
        enable = 1'b0;
        y = 0;
        #10 enable = 1'b1;

        for (i=0; i< (1<<N); i = i+1) begin
            y = i;
            #10;
        end
        $finish;
    end

endmodule
