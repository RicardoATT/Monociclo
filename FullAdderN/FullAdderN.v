module FullAdderN #(
	parameter	N = 64
	)
	(
	input							c_i,
	input			[N-1:0] 		a_i,
	input			[N-1:0] 		b_i,
	output		[N-1:0]		s_o
	//output						c_o
	);

	wire			[N-1:0]		c_w;
	genvar						i;
	generate
		begin
			for (i = 0; i < N; i = i + 1)
			begin: genfor
				if (i == 0)
					FullAdder Adder(a_i[i], b_i[i], c_i, s_o[i], c_w[i]);
				else
					FullAdder Adder(a_i[i], b_i[i], c_w[i-1], s_o[i], c_w[i]);			
			end	//Warning en c_w[63] por no conectar el bit c_o (no usado)
		end
	endgenerate	
	//assign c_o	=	c_w[N-1];
	
endmodule 