`timescale 1ns/1ps

module priority_encoder_tb;

    reg  [7:0] D;
    wire [2:0] y;
    wire       valid;

    priority_encoder dut(
        .D(D),
        .y(y),
        .valid(valid)
    );

    integer i, j;

    reg [2:0] expected_y;
    reg       expected_valid;


    // Reference model (Vivado-safe)
    always @(*) begin
        expected_y     = 3'b000;
        expected_valid = 1'b0;

        for (j = 7; j >= 0; j = j - 1) begin
            if (!expected_valid && D[j]) begin
                expected_y     = j[2:0];
                expected_valid = 1'b1;
            end
        end
    end

    // stimulus + check
    initial begin
        $display("Starting simulation...");

        for (i = 0; i < 256; i = i + 1) begin
            D = i[7:0];   // 
            #1;           // 
            if (y !== expected_y || valid !== expected_valid) begin
                $display("FAILED: D=%b y=%b exp=%b valid=%b exp_valid=%b",
                          D, y, expected_y, valid, expected_valid);
                $finish;
            end
        end

        $display("PASSED: All test cases successful!");
        $finish;
    end

endmodule


