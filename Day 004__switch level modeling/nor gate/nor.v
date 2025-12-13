`timescale 1ns/1ps

module nor_gate (
    input a,b,
    output y
);

supply1 vdd;
supply0 gnd;

//define variable
wire temp;

// define pmos
pmos p1(temp,vdd,a);
pmos p2(y,temp,b);

// define nmos
nmos n1(y,gnd,a);
nmos n2(y,gnd,b);

endmodule