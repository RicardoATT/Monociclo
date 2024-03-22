module RegisterFile #(
	parameter					width = 64,		//ancho
	parameter					depth = 5		//profundidad
)
(
	input							clk_i,
	input			[depth-1:0]	addr_a_i,		//Address A
	output reg	[width-1:0]	data_a_o,		//data A
	input			[depth-1:0]	addr_b_i,		//Address B
	output reg	[width-1:0]	data_b_o,		//data B
	input							wr_en_i,			//write enable
	input			[depth-1:0]	addr_wr_i,		//address write
	input			[width-1:0]	data_wr_i		//data write
);
	//Definición de la memoria
	reg			[width-1:0]	mem[(2**depth)-1:0];
	initial
	begin
		mem[5'h0] = 64'h0;
		
	end
	//Escritura
	always @(posedge clk_i)
	begin
		if (wr_en_i)
		begin
			if (addr_wr_i == 5'h0)
				begin
					mem[addr_wr_i] <= 64'h0;
				end
			else
				mem[addr_wr_i] <= data_wr_i;
		end
	end
	//Lectura Puerto A y B
	always @(*)
	begin
		data_a_o 	= 	mem[addr_a_i];
		data_b_o 	= 	mem[addr_b_i];
	end
endmodule 