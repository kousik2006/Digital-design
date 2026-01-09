module decoder(
    input wire [2:0]y,
    output reg [7:0]D,
    input wire enable
);

always @(*) begin

    // default value to avoid latch
    D = {8{1'b0}};
    
    if(enable) begin
    case(y)
        3'b000 :  D = 8'b00000001; 
        3'b001 :  D = 8'b00000010; 
        3'b010 :  D = 8'b00000100; 
        3'b011 :  D = 8'b00001000;
        3'b100 :  D = 8'b00010000; 
        3'b101 :  D = 8'b00100000; 
        3'b110 :  D = 8'b01000000; 
        3'b111 :  D = 8'b10000000; 
    endcase
    end
end
endmodule