module mod10_up_counter (
    input wire clk,
    input wire reset,
    input wire dir,
    output reg [3:0] count,     // LEDs
    output reg [6:0] seg,       // 7 segment segments
    output reg [3:0] an,        // digit enable
    output wire dp              // decimal point
);

//////////////// CLOCK DIVIDER //////////////////////
// 100 MHz → 1 Hz
reg [26:0] div = 0;
reg tick = 0;

always @(posedge clk) begin
    if (reset) begin
        div  <= 0;
        tick <= 0;
    end
    else if (div == 27'd99_999_999) begin
        div  <= 0;
        tick <= 1;          // one pulse every second
    end
    else begin
        div  <= div + 1;
        tick <= 0;
    end
end

//////////////// up down MOD-10 COUNTER /////////////////////
//////////////// UP/DOWN MOD-10 COUNTER /////////////////////
always @(posedge clk) begin
    if (reset)
        count <= 4'd0;

    else if (tick) begin

        // UP COUNT
        if (dir == 1'b1) begin
            if (count == 4'd9)
                count <= 4'd0;
            else
                count <= count + 1;
        end

        // DOWN COUNT
        else begin
            if (count == 4'd0)
                count <= 4'd9;
            else
                count <= count - 1;
        end

    end
end


//////////////// 7 SEGMENT DECODER //////////////////
// Basys3 display is ACTIVE LOW
// segment order: a b c d e f g
always @(*) begin
    case(count)
        4'd0: seg = 7'b1000000;
        4'd1: seg = 7'b1111001;
        4'd2: seg = 7'b0100100;
        4'd3: seg = 7'b0110000;
        4'd4: seg = 7'b0011001;
        4'd5: seg = 7'b0010010;
        4'd6: seg = 7'b0000010;
        4'd7: seg = 7'b1111000;
        4'd8: seg = 7'b0000000;
        4'd9: seg = 7'b0010000;
        default: seg = 7'b1111111;
    endcase
end

// enable only first display (AN0 active LOW)
always @(*) begin
    an = 4'b1110;
end

// decimal point OFF
assign dp = 1'b1;

endmodule
