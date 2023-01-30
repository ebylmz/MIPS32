module mips32(
	input clock,
	input reset);

	wire [31:0] instr, pc;
	wire [31:0] dmem_addr, dmem_write_data, dmem_read_data;
	wire dmem_read, dmem_write;
	
	
	instr_mem imem(
		.mem_out(instr),
		.address(pc),
		.clock(clock));
	
	core mips_core(
		.pc(pc),
		.dmem_read(dmem_read), 
		.dmem_write(dmem_write),
		.dmem_addr(dmem_addr),
		.dmem_write_data(dmem_write_data),
		.instr(instr),
		.dmem_read_data(dmem_read_data),
		.clock(clock),
		.reset(reset));


	data_memory dmem(
		.mem_out(dmem_read_data),
		.address(dmem_addr),
		.write_data(dmem_write_data),
		.write_enable(dmem_write),
		.read_enable(dmem_read),
		.clock(clock));

endmodule 