module SignExtend #(
	parameter		N 	= 64,		//Numero de bits a extenderse
	parameter		M 	= 12		//Numero de bits del inmediato
)
(
	input				[31:0]		if_instr_i,		//Instruccion
	output 	reg	[N-1:0]		se_immed_o		//Inmediato de signo extendido
);

	always @(*)
	begin
		case (if_instr_i[6:0])						//OPCODE
			//Tipo I
			7'b0010011:
							se_immed_o	=	{{N-M{if_instr_i[31]}},if_instr_i[31:20]};
			//Tipo S
			7'b0100011:			 		
							se_immed_o	=	{{N-M{if_instr_i[31]}},{if_instr_i[31:25],if_instr_i[11:7]}};
			//Tipo L
			7'b0000011:			 		
							se_immed_o	=	{{N-M{if_instr_i[31]}},if_instr_i[31:20]};
			//Tipo B
			7'b1100011:			 		
							se_immed_o	=	{{N-M{if_instr_i[31]}},{if_instr_i[31],if_instr_i[7],if_instr_i[30:25],if_instr_i[11:8]}};
			//Tipo J
			7'b1101111:			 		
							se_immed_o	=	{{44{if_instr_i[31]}},{if_instr_i[31],if_instr_i[19:12],if_instr_i[20],if_instr_i[30:21]}};
			default: 
							se_immed_o	=	{N{1'b0}};
		endcase	
	end
endmodule 
