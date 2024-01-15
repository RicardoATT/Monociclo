module FullAdder (
	input				a_i,
	input				b_i,
	input				cin_i,
	output			s_o,
	output 			cout_o
);
	wire				xor1_w;
	wire				and1_w;
	wire				and2_w;

	assign			xor1_w = a_i ^ b_i;
	xor				xor2		(s_o, xor1_w, cin_i);
	assign			and1_w = xor1_w & cin_i;
	and				and2		(and2_w, a_i, b_i);
	or					or1		(cout_o, and1_w, and2_w);
	
endmodule 