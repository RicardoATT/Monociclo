module SignExtendPC (
	input				[31:0]	pc_return,		//Numero de bits del PC
	output 	reg	[63:0]	se_pc_return	//Numero de bits a extenderse
);
	always @(*)
	begin
		se_pc_return = {{32{1'b0}},pc_return};
	end
endmodule 
