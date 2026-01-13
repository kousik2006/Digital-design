module demux #(
    parameter P = 2
)(
    input data,
    input [P-1:0]select,
    output reg [(1<<P)-1:0]y
);
    always @(*) begin
        y = data << select; 
    end
endmodule