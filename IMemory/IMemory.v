module IMemory #(
	parameter						width = 32,		//ancho de palabra
	parameter						depth = 5		//profundidad (2**n)
)
(
	input								clk_i,			//clock signal
	input								rd_en_i,			//Read enable
	input				[depth-1:0]	addr_rd_i,		//address read
	output	reg	[width-1:0]	data_rd_o		//Data read
);
	//Definición de la memoria
	reg			[width-1:0]	mem[(2**depth)-1:0];
	//Inicializacion de memoria de instrucciones
	initial
		begin
			$readmemh("Instr_Memo.hex", mem);
		end
	//Lectura de instruccion
	always @(*)
	begin	
		data_rd_o = (rd_en_i) ? mem[addr_rd_i] : {width{1'b0}};
	end
endmodule 