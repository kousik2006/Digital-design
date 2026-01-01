`timescale 1ns/1ps

module nand_gate (
    input a,b,
    output y
);

supply1 vdd;
supply0 gnd;

//define variable
wire temp;

// define pmos
pmos p1(y,vdd,a);
pmos p2(y,vdd,b);

// define nmos
nmos n1(y,temp,a);
nmos n2(temp,gnd,b);

endmodule