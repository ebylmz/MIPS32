module instr_mem(
	output [31:0] mem_out,
	input [31:0] address,
	input clock);

	reg [31:0] memory [127:0];
	
	initial begin	
		$readmemb("D:/intelFPGA_lite/18.1/workspace/mips32/mem/instr.mem", memory);
	end
	
	assign mem_out = memory[address];
	
	
endmodule