`timescale 1ns/1ps

module half_subtractor(
    input a,b,
    output diff,borrow
);

wire t1,t2,t3;

nor g1(t1,a,b);
nor g2(t2,b,t1);
nor BORROW(borrow,t1,a);
nor g3(t3,t2,borrow);
nor DIFF(diff,t3,t3);


endmodule
