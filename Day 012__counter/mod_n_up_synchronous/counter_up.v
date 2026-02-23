// Here n is the number of bits.........

module up_counter #(parameter N = 3)(
    input wire clk,
    input wire reset,
    input wire preset,
    output reg [N-1:0] count
) ;

// asynchronous reset


always @(posedge clk or posedge reset or posedge preset) begin
    if(reset) count <= {N{1'b0}};
    else if (preset) count <= {N{1'b1}};
    else count <= count + 1;
end

endmodule