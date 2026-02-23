`timescale 1ns/1ps

module sr_latches_tb;
wire Q,Q_bar;
reg s,r,enable;

sr_latches dut (
    .s(s),
    .r(r),
    .enable(enable),
    .Q(Q),
    .Q_bar(Q_bar)
);
integer i;
initial begin
    // initial condition
    enable = 1'b1;
    s = 1'b0;
    r = 1'b0;

    $monitor ("time = %t, enable = %b,  s= %b, r = %b, Q = %b, Q_bar = %b",$time,enable,s,r,Q,Q_bar);
    for (i=0 ; i<4; i=i+1) begin
        {s,r} = i;
        #10;
    end

    s = 1'b1;
    r = 1'b0;
    #10;

    enable = 1'b0;
    for (i=0 ; i<4; i=i+1) begin
        {s,r} = i;
        #10;
    end
    $finish;
end

endmodule