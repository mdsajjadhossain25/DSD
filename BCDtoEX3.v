
module Bcd_to_Ex3(input [3:0]b, output[3:0]e );
	wire a,x,c;
	assign e[0]=~b[0];
	xnor(a, b[1], b[0]);
	assign e[1]= a;
	or(x, b[1], b[0]);
	xor(c, x, b[2]);
	assign e[2]= c;
	assign e[3]=b[3]|(b[2]&(b[0]|b[1]));
endmodule
