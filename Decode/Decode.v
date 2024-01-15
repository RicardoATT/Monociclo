module Decode (
	input			[6:0]	opcode_i,
	output reg			regwrite_o,
	output reg			memread_o, 
	output reg			memwrite_o,
	output reg			memtoreg_o,
	output reg			alusrc_o,  
	output reg	[2:0]	aluop_o,   
	output reg			branch_o,  
	output reg			jump_o     
);
	always @(*)
	begin
		case (opcode_i)
			//Tipo R
			7'b0110011:
				begin
					regwrite_o	=	1'b1;
					memread_o	=	1'b0;
					memwrite_o	=	1'b0;
					memtoreg_o	=	1'b0;
					alusrc_o		=	1'b0;
					aluop_o		=	3'b001;
					branch_o		=	1'b0;
					jump_o		=	1'b0;
				end
			//Tipo I
			7'b0010011:
				begin
					regwrite_o	=	1'b1;
					memread_o	=	1'b0;
					memwrite_o	=	1'b0;
					memtoreg_o	=	1'b0;
					alusrc_o		=	1'b1;
					aluop_o		=	3'b010;
					branch_o		=	1'b0;
					jump_o		=	1'b0;
				end
			//Tipo S
			7'b0100011:
				begin
					regwrite_o	=	1'b0;
					memread_o	=	1'b0;
					memwrite_o	=	1'b1;
					memtoreg_o	=	1'b0;
					alusrc_o		=	1'b1;
					aluop_o		=	3'b011;
					branch_o		=	1'b0;
					jump_o		=	1'b0;
				end
			//Tipo L
			7'b0000011:
				begin
					regwrite_o	=	1'b1;
					memread_o	=	1'b1;
					memwrite_o	=	1'b0;
					memtoreg_o	=	1'b1;
					alusrc_o		=	1'b1;
					aluop_o		=	3'b100;
					branch_o		=	1'b0;
					jump_o		=	1'b0;
				end
			//Tipo J
			7'b1101111:
				begin
					regwrite_o	=	1'b0;
					memread_o	=	1'b0;
					memwrite_o	=	1'b0;
					memtoreg_o	=	1'b0;
					alusrc_o		=	1'b0;
					aluop_o		=	3'b101;
					branch_o		=	1'b0;
					jump_o		=	1'b1;
				end
			//Tipo B
			7'b1100011:
				begin
					regwrite_o	=	1'b0;
					memread_o	=	1'b0;
					memwrite_o	=	1'b0;
					memtoreg_o	=	1'b0;
					alusrc_o		=	1'b0;
					aluop_o		=	3'b110;
					branch_o		=	1'b1;
					jump_o		=	1'b0;
				end
			default:
				begin
					regwrite_o	=	1'b0;
					memread_o	=	1'b0;
					memwrite_o	=	1'b0;
					memtoreg_o	=	1'b0;
					alusrc_o		=	1'b0;
					aluop_o		=	3'b000;
					branch_o		=	1'b0;
					jump_o		=	1'b0;
				end
		endcase
	end
endmodule 