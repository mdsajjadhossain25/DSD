module Ex3_to_BCD(input [3:0]e, output[3:0]b );
	wire p;
	assign b[0]=~e[0];
	xor(p, e[1], e[0]);
	assign b[1]=p;
	assign b[2]= (~e[2]&~e[1])|(e[2]&e[1]&e[0])|(~e[2]&~e[0]);
	assign b[3]= (e[3]&e[2])|(e[3]&e[1]&e[0]);
endmodule
