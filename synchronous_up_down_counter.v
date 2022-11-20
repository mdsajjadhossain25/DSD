/*when m = 0 - up counting
when m=1 - down counting.
counting sequence 000- 001-010-011-100-101-110-111-000*/

module synchronous_upDown(q, qb, clr, clk, m);

input m, clr, clk;

output[2:0] q, qb;

wire p, ja, ka, jb, kb, jc, kc;

assign ja = 1'b1;
assign ka = 1'b1;
JKFF jk0(q[0], qb[0], ja, ka, clr, clk);
xor(p, m, q[0]);
assign jb = p;
assign kb = p;
JKFF jk1(q[1], qb[1], jb, kb, clr, clk);
assign jc = (m&qb[1]&qb[0])|(~m&q[1]&q[0]);
assign kc = (m&qb[1]&qb[0])|(~m&q[1]&q[0]);
JKFF jk2(q[2], qb[2], jc, kc, clr, clk);


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
