`timescale 1ns/1ps

//mux design by vector.....
module mux_design_vector(
    input [1:0] data,
    input select,
    output y
);
    assign y = data[select];

endmodule

// mux design by conditional........
module mux_design_conditional (
    input i0,i1,
    input select,
    output y
);
    assign y = select ? i1 : i0;
endmodule


// or gate 
module or_gate (
    input a,b,
    output or_
);
    mux_design_vector u1(
        .data({1'b1,b}), // data[1] = 1 (msb), data[0] = b (lsb);
        .select(a),
        .y(or_)
    );
endmodule

// and gate 
module and_gate(
    input a,b,
    output and_
);
    mux_design_conditional u2(
        .i0(1'b0),
        .i1(b),
        .select(a),
        .y(and_)
    );
endmodule

// nand gate
module nand_gate(
    input a,b,
    output nand_
);
    wire not_b;
    assign not_b = ~b;
    mux_design_vector u3(
        .data({not_b,1'b1}),
        .select(a),
        .y(nand_)
    );
endmodule

// nor gate
module nor_gate(
    input a,b,
    output nor_
);
    mux_design_conditional u4(
        .i0(~b),
        .i1(1'b0),
        .select(a),
        .y(nor_)
    );

endmodule

// xor gate
module xor_gate(
    input a,b,
    output xor_
);
    wire not_b;
    assign not_b = ~b;
    mux_design_vector u5(
        .data({not_b,b}),
        .select(a),
        .y(xor_)
    );
endmodule

//xnor
module xnor_gate(
    input a,b,
    output xnor_
);
    mux_design_conditional u6(
        .i0(~b),
        .i1(b),
        .select(a),
        .y(xnor_)
    );
endmodule


//all logic gates in a main module
module logic_gates_top (
    input  a, b,
    output and_,
    output or_,
    output nand_,
    output nor_,
    output xor_,
    output xnor_
);

    and_gate  U_AND  (.a(a), .b(b), .and_(and_));
    or_gate   U_OR   (.a(a), .b(b), .or_(or_));
    nand_gate U_NAND (.a(a), .b(b), .nand_(nand_));
    nor_gate  U_NOR  (.a(a), .b(b), .nor_(nor_));
    xor_gate  U_XOR  (.a(a), .b(b), .xor_(xor_));
    xnor_gate U_XNOR (.a(a), .b(b), .xnor_(xnor_));

endmodule
