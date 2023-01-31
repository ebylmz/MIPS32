module core_tb();

	wire [31:0] _alu_a, _alu_b, _reg_write_data;
	wire [31:0] instr_addr;
	wire mem_read, mem_write;
	wire [31:0] dmem_addr, dmem_write_data;
	reg [31:0] instr;
	reg [31:0] dmem_read_data;
	reg clock = 1'b0;
	reg reset = 1'b0;
	
	core mips_core(
		._alu_a(_alu_a), 
		._alu_b(_alu_b), 
		._reg_write_data(_reg_write_data),
		.instr_addr(instr_addr),
		.mem_read(mem_read), 
		.mem_write(mem_write),
		.dmem_addr(dmem_addr),
		.dmem_write_data(dmem_write_data),
		.instr(instr),
		.dmem_read_data(dmem_read_data),
		.clock(clock),
		.reset(reset));
		
	always begin
		#5 clock = ~clock; 
	end

	initial begin
		dmem_read_data = 32'h0;
		
		#10 instr = 32'b00011100000000010000000000000101;   // li $1, $0(0x5)
		#10 instr = 32'b00011100000000100000000000000110;   // li $2, $0(0x6)
		#10 instr = 32'b00000000001000100001100000100000;   // add $3, $1, $2
		#10 ;
	end

endmodule