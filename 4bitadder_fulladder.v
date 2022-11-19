module FA(s, cout, a,b,cin);
input a,b,cin;
output s, cout;

wire x, y, z ;

xor(x, a, b);
and (y, a,b);
and(z, cin, x);

xor(s, a,b,cin);
or(cout, y, z);

endmodule

module FA_4_bit(sum, cout, a,b,cin);

input [3:0]a, b;
input cin;
output [3:0] sum;
output cout;

wire c1,c2, c3;

FA fa0(sum[0], c1, a[0], b[0], cin);
FA fa1(sum[1], c2, a[1], b[1], c1);
FA fa2(sum[2], c3, a[2], b[2], c2);
FA fa3(sum[3], cout, a[3], b[3], c3);

endmodule



