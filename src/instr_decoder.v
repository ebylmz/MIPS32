module instr_decoder(
	output [5:0] opcode,
	output [4:0] rs,
	output [4:0] rt,
	output [4:0] rd,
	output [4:0] shamt,
	output [5:0] func,
	output [15:0] immediate,
	output [25:0] address,
	input [31:0] instr);


	assign opcode = instr[31:26];
	assign rs = instr[25:21];
	assign rt = instr[20:16];
	assign rd = instr[15:11];
	assign shamt = instr[10:6];
	assign func = instr[5:0];
	assign immediate = instr[15:0];
	assign address = instr[25:0];
	
endmodule 