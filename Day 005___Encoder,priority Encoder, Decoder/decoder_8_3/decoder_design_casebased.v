module decoder(
    input wire [2:0]y,
    output reg [7:0]D,
    output reg valid
);

always @(*) begin

    // default value to avoid latch
    
    
    case(y)
        3'b000 : begin D = 8'b00000001; valid = 1'b1; end
        3'b001 : begin D = 8'b00000010; valid = 1'b1; end
        3'b010 : begin D = 8'b00000100; valid = 1'b1; end
        3'b011 : begin D = 8'b00001000; valid = 1'b1; end
        3'b100 : begin D = 8'b00010000; valid = 1'b1; end
        3'b101 : begin D = 8'b00100000; valid = 1'b1; end
        3'b110 : begin D = 8'b01000000; valid = 1'b1; end
        3'b111 : begin D = 8'b10000000; valid = 1'b1; end

        default : begin D = 8'b00000000; valid = 1'b0; end
    endcase
end
endmodule