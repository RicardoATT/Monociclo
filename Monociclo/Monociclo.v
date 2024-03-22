/*
Proyecto: 		Monociclo
Archivo:			Monociclo.v
Organización:	Instituto Politecnico Nacional
Autor:			Ing. Ricardo Aldair Tirado Torres
E-mail:			rtiradot2023@cic.ipn.mx
Referencias:	Libro Lagarto I, Capítulo 1
					Libro Lagarto I, Capítulo 2
*/

module Monociclo (
	input							clk_i,
	input							rst_ni,
	output		[63:0]	wb_data_o
	);
	
/*
El monociclo se puede dividir generalmente en 5 etapas:
	-IF: 		Búsqueda de instrucciones
	-ID/RF: 	Decodificación de instrucciones y búsqueda de operandos
	-EX/AG: 	Ejecución/Cálculo de la dirección de memoria
	-MEM: 	Búsqueda de los operandos en memoria
	-WB: 		Almacenamiento/Escritura de retorno del resultado
*/	

///////////////////////// DEFINICIÓN DE SEÑALES /////////////////////////
	
// FETCH
	reg			[31:0]	pc;
	wire			[31:0]	pc_next4;
	wire			[31:0]	pc_next_bj;
	wire			[63:0]	pc_next_ext;
	wire			[31:0]	if_instr_o;
	wire						pc_control;

// INSTRUCTION DECODE
	wire 						id_regwrite_o;
	wire 						id_memread_o;
	wire 						id_memwrite_o;
	wire 						id_memtoreg_o;
	wire 						id_alusrc_o; 
	wire 			[2:0]		id_aluop_o;  
	wire 						id_branch_o; 
	wire 						id_jump_o;   
	wire 			[3:0]		alu_control_o; 

// REGISTER READ
	wire			[63:0]	rr_data1_o;
	wire			[63:0]	rr_data2_o;
	wire			[63:0]	mux_wb_o;

// SIGN EXTENSION
	wire			[63:0]	se_immed_o;
	wire			[63:0]	mux_alusrc_o;
	wire			[63:0]	se_shift_o;

// EXECUTION
	wire			[63:0]	ex_res_o;
	wire						b_flag_o;

// MEMORY ACCESS
	wire			[63:0]	mem_data_o;

/////////////////////////	ETAPA FETCH - BÚSQUEDA DE INSTRUCCIONES /////////////////////////
	
	always @(posedge clk_i, negedge rst_ni)
	begin
		if (!rst_ni)
			pc <= 32'b0;
		else
			pc <= (pc_control) ? pc_next_bj : pc_next4;
	end

// Calculo del PC
	FullAdderN #( 
		.N				(32)
	)	
	Add4
	(
		.c_i			(1'b0),		//Warning por colocar al c_i a GND
		.a_i			(pc),
		.b_i			(32'h4),
		.s_o			(pc_next4)
		//.c_o			(c_o)
	);

// Instruction cache
	IMemory Instr_Mem (
		.clk_i			(clk_i),
		.rd_en_i			(1'b1),			//Enable Read		//Warning por conexion a VCC
		.addr_rd_i		(pc[6:2]),		//Address Read		//Warning por conexion a GND
		.data_rd_o		(if_instr_o)	//Data Read
	);

///////////////////////// ETAPA DECODE - DECODIFICACIÓN /////////////////////////

	Decode Deco(
		.opcode_i		(if_instr_o[6:0]),
		.regwrite_o		(id_regwrite_o),
		.memread_o		(id_memread_o),
		.memwrite_o		(id_memwrite_o),
		.memtoreg_o		(id_memtoreg_o),
		.alusrc_o 		(id_alusrc_o),
		.aluop_o  		(id_aluop_o),
		.branch_o 		(id_branch_o),
		.jump_o			(id_jump_o)
	);
	
	DecodeALU DecoALU(
		.aluop_i			(id_aluop_o),
		.f7f3				({if_instr_o[30],if_instr_o[14:12]}),
		.alu_control_o	(alu_control_o)
	);

///////////////////////// REGISTER READ - BÚSQUEDA DE OPERANDOS /////////////////////////
	
	SignExtendPC SignExtPC (
		.pc_return		(pc_next4),				//PC retorno
		.se_pc_return	(pc_next_ext)		//PC retorno extendido
	);
	assign	mux_wb_o = (id_jump_o) ? pc_next_ext : wb_data_o;
	
	RegisterFile #(
		.width 		(64),		//ancho
		.depth 		(5)		//profundidad
	)
	RegFile (
		.clk_i		(clk_i),
		.addr_a_i	(if_instr_o[19:15]),	//Address A
		.data_a_o	(rr_data1_o),			//Data A
		.addr_b_i	(if_instr_o[24:20]),	//Address B
		.data_b_o	(rr_data2_o),			//Data B
		.wr_en_i		(id_regwrite_o),		//Register write
		.addr_wr_i	(if_instr_o[11:7]),	//Address destination
		.data_wr_i	(mux_wb_o)				//Data write back
	);

///////////////////////// SIGN EXTENSION - EXTENSION DE SIGNO /////////////////////////
	
	SignExtend SignExt (
		.if_instr_i	(if_instr_o),			//Instruccion
		.se_immed_o	(se_immed_o)			//Inmediato con signo extendido
	);
		assign	mux_alusrc_o = (id_alusrc_o) ? se_immed_o : rr_data2_o;
		assign	se_shift_o	 = se_immed_o << 1;

/////////////////////////	EXECUTION STAGE - EJECUCIÓN /////////////////////////
	
	ALU Exe (
		.op1_i	(rr_data1_o),				//Operador 1
		.op2_i	(mux_alusrc_o),			//Operador 2
		.ope_i	(alu_control_o),			//Codigo de operacion de ALU
		.res_o	(ex_res_o),					//Resultado ALU
		.b_flag	(b_flag_o)
	);
	
	BJcontrol BJctrl(
		.branch_i		(id_branch_o),
		.jump_i			(id_jump_o),
		.b_flag_i		(b_flag_o),
		.pc_control_o	(pc_control)
	);
	
	FullAdderN #( 
		.N				(32)
	)	
	Addpc
	(
		.c_i			(1'b0),					//Warning por colocar al c_i a GND
		.a_i			(pc),
		.b_i			(se_shift_o[31:0]),	//Warning debido a que por corrimiento a ña izquierda, b_i[0] = 0
		.s_o			(pc_next_bj)
		//.c_o			(c_o)
	);

///////////////////////// DATA CACHE - ACCESO A MEMORIA /////////////////////////

	Memory DataMem (
		.clk_i			(clk_i),
		.rd_en_i			(id_memread_o),			//Read enable
		.addr_rd_i		(ex_res_o[12:3]),			//Address read
		.data_rd_o		(mem_data_o),				//Data read
		.wr_en_i			(id_memwrite_o),			//Write enable
		.addr_wr_i		(ex_res_o[12:3]),			//Address write
		.data_wr_i		(rr_data2_o)				//Data write
	);

/////////////////////////	ETAPA WRITE BACK - ESCRITURA DE RETORN DEL RESULTADO /////////////////////////

	assign wb_data_o = (id_memtoreg_o) ? mem_data_o : ex_res_o;
		
endmodule 


`timescale 1 ps/ 1 ps
module Monociclo_vlg_tst();
reg clk_i;
reg rst_ni;
// wires                                               
wire [63:0]  wb_data_o;
                       
Monociclo i1 (  
	.clk_i(clk_i),
	.rst_ni(rst_ni),
	.wb_data_o(wb_data_o)
);
initial                                                
begin
clk_i = 1;
rst_ni = 0;
#100 rst_ni = 1;                                               
$display("Running testbench");                       
end                                                    
always              
begin                                                  
#50 clk_i = ~clk_i;                      
end                                                    
endmodule