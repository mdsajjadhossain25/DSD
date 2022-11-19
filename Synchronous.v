/*0000-0100-0111-1000-1010-1101-1001-1111-0000*/

module synchronous_counter(q, qb, clr, clk);

input clr, clk;

output[3:0] q, qb;

wire j0, k0, j1, k1, j2, k2, j3, k3;

    assign j0 = q[3]&q[1] | (~q[3]&q[2]&~q[1]);
    assign k0 = q[1] | ~q[3];


JKFF jk0(q[0], qb[0], j0, k0, clr, clk);
    assign j1 = (q[3]&~q[2]) | (~q[3]&q[2]&~q[0]);
    assign k1 = 1;
JKFF jk1(q[1], qb[1], j1, k1, clr, clk);
    assign j2 = (~q[3]&~q[1]&~q[0]) | q[3]&(q[1]^q[0]);
    assign k2 = q[3] | (q[1]&~q[0]) | q[0];
JKFF jk2(q[2], qb[2], j2, k2, clr, clk);
    assign j3 = q[2]&q[1]&q[0];
    assign k3 = q[2]&~q[0] | (q[1]&q[0]);
JKFF jk3(q[3], qb[3], j3, k3, clr, clk);


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
