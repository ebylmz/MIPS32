module mips32(
	output [31:0] _alu_a, 
	output [31:0] _alu_b,
	output [31:0] _reg_write_data,
	output [31:0] _instr,
	output [31:0] _instr_addr,
	input clock,
	input reset);

	wire [31:0] instr, pc;
	wire mem_read, mem_write;

	// instruction memory
	instr_mem imem(
		.mem_out(instr),
		.address(instr_addr),
		.clock(clock));
	
	
	wire [31:0] dmem_addr, dmem_write_data, dmem_read_data;
	
	// core
	core mips_core(
	 	._alu_a(_alu_a), 
	 	._alu_b(_alu_b),
	 	._reg_write_data(_reg_write_data),
		.pc(pc),
		.mem_read(mem_read), 
		.mem_write(mem_write),
		.dmem_addr(dmem_addr),
		.dmem_write_data(dmem_write_data),
		.instr(instr),
		.dmem_read_data(dmem_read_data),
		.clock(clock),
		.reset(reset));


	// data memory
	data_memory dmem(
		.mem_out(dmem_read_data),
		.address(dmem_addr),
		.write_data(dmem_write_data),
		.write_enable(mem_write),
		.read_enable(mem_read),
		.clock(clock));

	// ********************************* for debugging *********************************
	assign _instr = instr;
	assign _instr_addr = instr_addr;


endmodule 