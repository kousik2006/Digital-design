`timescale 1ns/1ps

module or_gate (
    input a,b,
    output out
);

supply1 vdd;
supply0 gnd;

//define variable
wire temp;
wire y;

// define pmos
pmos p1(temp,vdd,a);
pmos p2(y,temp,b);

// define nmos
nmos n1(y,gnd,a);
nmos n2(y,gnd,b);

//inverter
pmos(out,vdd,y);
nmos(out,gnd,y);

endmodule