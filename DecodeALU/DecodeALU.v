module DecodeALU (
	input				[2:0]	aluop_i,
	input				[3:0] f7f3,
	output	reg	[3:0]	alu_control_o
);
	always @(*)
		begin
			case (aluop_i)
				//Tipo R
				3'b001:
					begin
						case (f7f3)
							4'b0_000:	//add
								alu_control_o = 4'b0000;
							4'b1_000:	//sub
								alu_control_o = 4'b0001;
							4'b0_001:	//sll
								alu_control_o = 4'b0010;
							4'b0_010:	//slt
								alu_control_o = 4'b0011;
							4'b0_011:	//sltu
								alu_control_o = 4'b0100;
							4'b0_100:	//xor
								alu_control_o = 4'b0101;
							4'b0_101:	//srl
								alu_control_o = 4'b0110;
							4'b1_101:	//sra
								alu_control_o = 4'b0111;
							4'b0_110:	//or
								alu_control_o = 4'b1000;
							4'b0_111:	//and
								alu_control_o = 4'b1001;
							default:
								alu_control_o = 4'b1111;
						endcase
					end
				//Tipo I
				3'b010:
					begin
						case (f7f3)
							4'b0_000:	//add
								alu_control_o = 4'b0000;
							4'b0_001:	//sll
								alu_control_o = 4'b0010;
							4'b0_010:	//slt
								alu_control_o = 4'b0011;
							4'b0_011:	//sltu
								alu_control_o = 4'b0100;
							4'b0_100:	//xor
								alu_control_o = 4'b0101;
							4'b0_101:	//srl
								alu_control_o = 4'b0110;
							4'b1_101:	//sra
								alu_control_o = 4'b0111;
							4'b0_110:	//or
								alu_control_o = 4'b1000;
							4'b0_111:	//and
								alu_control_o = 4'b1001;
							default:
								alu_control_o = 4'b1111;
						endcase
					end
				//Tipo S
				3'b011:
					alu_control_o = 4'b0000;
				//Tipo L
				3'b100:
					alu_control_o = 4'b0000;
				//Tipo B
				3'b110:
					begin
						case (f7f3)
							4'b000:	//beq
								alu_control_o = 4'b0101;
							4'b001:	//bne
								alu_control_o = 4'b0001;
							4'b100:	//blt
								alu_control_o = 4'b0011;
							4'b101:	//bge
								alu_control_o = 4'b1011;
							4'b110:	//bltu
								alu_control_o = 4'b0100;
							4'b111:	//bgeu
								alu_control_o = 4'b1100;
							default:
								alu_control_o = 4'b1111;
						endcase
					end
				default:
					alu_control_o = 4'b1111;
			endcase
		end
endmodule	