module priority_encoder(
    input [7:0]D,
    output reg [2:0]y,
    output reg valid
);

always @(*) begin

    // default values to avoid latches...
    y = 3'b000;
    valid = 1'b0;
    
    if(D[7]==1'b1) begin y = 3'b111; valid = 1'b1; end
    else if(D[6]==1'b1) begin y = 3'b110; valid = 1'b1; end
    else if(D[5]==1'b1) begin y = 3'b101; valid = 1'b1; end
    else if(D[4]==1'b1) begin y = 3'b100; valid = 1'b1; end
    else if(D[3]==1'b1) begin y = 3'b011; valid = 1'b1; end
    else if(D[2]==1'b1) begin y = 3'b010; valid = 1'b1; end
    else if(D[1]==1'b1) begin y = 3'b001; valid = 1'b1; end
    else if(D[0]==1'b1) begin y = 3'b000; valid = 1'b1; end


end
endmodule


