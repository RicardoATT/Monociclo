module	ALU #(
	parameter			width	= 64
)
(
	input					[width-1:0]		op1_i,
	input					[width-1:0]		op2_i,
	input					[3:0]				ope_i,
	output	reg		[width-1:0]		res_o,
	output	reg							b_flag
);
	reg										c_i;
	reg					[width-1:0]		op2_neg;
	wire					[width-1:0]		res_addsub_w;
	
	always @(*)
	begin
		case (ope_i)
			//Suma - add
			4'b0000:
				begin
					c_i		=	1'b0;
					op2_neg 	=	op2_i;
					res_o		=	res_addsub_w;
					b_flag	=	0;
				end
			//Resta - sub
			4'b0001:
				begin
					c_i		=	1'b1;
					op2_neg	=	~op2_i;
					res_o		=	res_addsub_w;
					//bne
					if (res_o != 0)
						b_flag 	=	1;
					else
						b_flag 	= 	0;
				end
			//Shift Left Logical - sll
			4'b0010:
				begin
					c_i		=	1'b0;
					op2_neg 	<=	op2_i;
					res_o 	= 	op1_i << op2_i;
					b_flag	=	0;
				end
			//Set If Less Than - slt (blt)
			4'b0011:
				begin
					if ($signed(op1_i) < $signed(op2_i))
						begin
							res_o 	= 	1;
							b_flag	=	1;
						end
					else
						begin
							res_o 	= 	0;
							b_flag	=	0;
						end
					c_i		=	1'b0;
					op2_neg 	=	op2_i;
				end
			//Set if Less Than Unsigned - sltu (bltu)
			4'b0100:
				begin
					if (op1_i < op2_i)
						begin
							res_o 	= 	1;
							b_flag	=	1;
						end
					else
						begin
							res_o 	= 	0;
							b_flag	=	0;
						end
					c_i		=	1'b0;
					op2_neg 	=	op2_i;
				end
			//XOR - xor
			4'b0101:
				begin
					c_i		=	1'b0;
					op2_neg 	=	op2_i;
					res_o 	= 	op1_i ^ op2_i;
					//beq
					if (res_o == 0)
						b_flag 	=	1;
					else
						b_flag	=	0;
				end
			//Shift Right Logical - srl
			4'b0110:
				begin
					c_i		=	1'b0;
					op2_neg 	=	op2_i;
					res_o 	= 	op1_i >> op2_i;
					b_flag	=	0;
				end
			//Shift Right Arithmetic - sra
			4'b0111:
				begin
					c_i		=	1'b0;
					op2_neg 	=	op2_i;
					res_o 	= 	op1_i >>> op2_i;
					b_flag	=	0;
				end
			//OR - or
			4'b1000:
				begin
					c_i		=	1'b0;
					op2_neg 	=	op2_i;
					res_o 	= 	op1_i | op2_i;
					b_flag	=	0;
				end
			//AND - and
			4'b1001:
				begin
					c_i		=	1'b0;
					op2_neg 	=	op2_i;
					res_o 	= 	op1_i & op2_i;
					b_flag	=	0;
				end
			//Set If Less Than - slt (bge)
			4'b1011:
				begin
					if ($signed(op1_i) < $signed(op2_i))
						begin
							res_o 	= 	1;
							b_flag	=	0;
						end
					else
						begin
							res_o 	= 	0;
							b_flag	=	1;
						end
					c_i		=	1'b0;
					op2_neg 	=	op2_i;
				end
			//Set if Less Than Unsigned - sltu (bgeu)
			4'b1100:
				begin
					if (op1_i < op2_i)
						begin
							res_o 	= 	1;
							b_flag	=	0;
						end
					else
						begin
							res_o 	= 	0;
							b_flag	=	1;
						end
					c_i		=	1'b0;
					op2_neg 	=	op2_i;
				end
			default:
				begin
					c_i		=	1'b0;
					res_o 	= 	32'b0;
					op2_neg 	=	op2_i;
					b_flag	=	0;
				end
		endcase
	end
	
	FullAdderN sumres (
		.c_i				(c_i),
		.a_i				(op1_i),
		.b_i				(op2_neg),
		.s_o				(res_addsub_w)
		//.c_o				(c_o)
	);
	
endmodule 