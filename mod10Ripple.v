module ripple_counter(q, qb, clr, clk);

input clr, clk;

output[3:0] q, qb;

wire a;

nand(a, q[3], q[1]);

JKFF jk0(q[0], qb[0], 1, 1, a, clk);
JKFF jk1(q[1], qb[1], 1, 1, a, q[0]);
JKFF jk2(q[2], qb[2], 1, 1, a, q[1]);
JKFF jk3(q[3], qb[3], 1, 1, a, q[2]);

endmodule

module JKFF(q, qb, j, k, clr, clk);

input clk, j,k,clr;
output q, qb;
wire a,b,c,d;

nand(a, j, qb, clk, clr);
nand(b, q, k, clk);
nand(c, a, d);
nand(d, b, c, clr);

not(cb, clk);

nand(e, cb, c);
nand(f, cb, d);
nand(q, e, qb);
nand(qb, f, clr, q);

endmodule
