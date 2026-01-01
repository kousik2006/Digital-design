`timescale 1ns/1ps

module switch_level_not (
    output wire out,
    input wire a
);

// setup power and ground line
supply1 vdd;
supply0 gnd;

// by pmos and nmos
pmos(out,vdd,a);
nmos(out,gnd,a);


    
endmodule