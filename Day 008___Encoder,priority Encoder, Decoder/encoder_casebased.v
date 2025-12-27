module encoder(
    input wire [3:0]D,
    output reg [1:0]y
);  

always @(*) begin
    

    case(D)
        4'b0001 : y = 2'b00;
        4'b0010 : y = 2'b01;
        4'b0100 : y = 2'b10;
        4'b1000 : y = 2'b11;
        default : y = 2'b00; //invalid case actually


    endcase

    //Another method
     /* case(1'b1)
        D[0] : y = 2'b00;
        D[1] : y = 2'b01;
        D[2] : y = 2'b10;
        D[3] : y = 2'b11;
        default : y = 2'b00; //invalid case actually


    endcase
 */

end

endmodule
