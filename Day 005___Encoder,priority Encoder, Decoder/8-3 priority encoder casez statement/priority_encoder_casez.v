module priority_encoder(
    input [7:0] D,
    output reg [2:0] y,
    output reg valid
);
always @(*) begin

    //set the default:-
    y = 3'b000;
    valid = 1'b0;

    casez(D)
    8'b1??????? : begin y = 3'b111; valid = 1'b1; end
    8'b01?????? : begin y = 3'b110; valid = 1'b1; end 
    8'b001????? : begin y = 3'b101; valid = 1'b1; end 
    8'b0001???? : begin y = 3'b100; valid = 1'b1; end 
    8'b00001??? : begin y = 3'b011; valid = 1'b1; end 
    8'b000001?? : begin y = 3'b010; valid = 1'b1; end 
    8'b0000001? : begin y = 3'b001; valid = 1'b1; end 
    8'b00000001 : begin y = 3'b000; valid = 1'b1; end 

    default : begin
        valid = 1'b0;
        y = 3'bzzz; //simulation visibility.........
    end
endcase

end

endmodule
