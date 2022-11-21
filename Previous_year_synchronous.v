/*0000-1101-1011-1001-0110-1100-0011-1111-0000*/

module synchronous_counter_new(q, qb, clr, clk);

input clr, clk;

output[3:0] q, qb;

wire j0, k0, j1, k1, j2, k2, j3, k3;

    assign j0 = qb[1];
    assign k0 = (q[2]&q[1])|(qb[2]&qb[1]);

JKFF jk0(q[0], qb[0], j0, k0, clr, clk);
    assign j1 = q[3];
    assign k1 = q[2]|q[3];
JKFF jk1(q[1], qb[1], j1, k1, clr, clk);
    assign j2 = qb[1]|(qb[3]&q[1]);
    assign k2 = qb[1]|q[0];
JKFF jk2(q[2], qb[2], j2, k2, clr, clk);
    assign j3 = 1'b1;
    assign k3 = (qb[1]&qb[0])|(q[2]&q[1])|(q[3]&qb[2]&qb[1]);
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
