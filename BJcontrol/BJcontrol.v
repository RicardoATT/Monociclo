module BJcontrol (
	input				branch_i,
	input				jump_i,
	input				b_flag_i,
	output	wire	pc_control_o
);
	wire			and_w;
	
	assign		and_w 			= branch_i & b_flag_i;
	assign		pc_control_o 	= jump_i ^ and_w;
endmodule	