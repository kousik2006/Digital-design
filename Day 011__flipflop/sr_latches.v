module  sr_latches(
    input s,r,enable,
    output reg Q,
    output Q_bar
);
always @(*) begin
    if(enable) begin
        case ({s,r})
            2'b01 : Q = 0;
            2'b10 : Q = 1;
            2'b11 : Q = 1'bx;
        endcase
        // (s,r = 0,0) hold state;
    // if (enable = 0) then hold state...
end
end
assign Q_bar = ~ Q;
endmodule

