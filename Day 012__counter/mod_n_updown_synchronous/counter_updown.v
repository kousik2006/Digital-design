module up_down #(
    parameter d = 4,
    parameter mod = 10
)(
    input wire clk,
    input wire reset,
    input wire up_down, // up = 1, down = 0;
    input wire enable,
    output reg [d-1:0] count
) ;

// synchronous reset
always @(posedge clk) begin
    if(reset) count <= 0;
    else if (enable) begin
        if(up_down) 
            count <= (count == mod - 1) ? 0 : count + 1;

        else
           count <= (count == 0) ? mod - 1 : count -1;
    end 

    // else -> automatically holds value 

end

endmodule