`timescale 1ns/1ps

module and_gate (
    input a,b,
    output out
);

supply1 vdd;
supply0 gnd;

//define variable
wire temp;
wire y;

// define pmos
pmos p1(y,vdd,a);
pmos p2(y,vdd,b);

// define nmos
nmos n1(y,temp,a);
nmos n2(temp,gnd,b);

//inverter
pmos(out,vdd,y);
nmos(out,gnd,y);

endmodule