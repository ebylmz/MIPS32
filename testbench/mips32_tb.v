`timescale 1 ps / 1 ps

module mips32_tb();
	reg clock = 1'b0, reset;
	
	wire [31:0] _alu_a, _alu_b, _reg_write_data;
	wire [31:0] _instr, _instr_addr;

	mips32 cpu(
	 	._alu_a(_alu_a), 
	 	._alu_b(_alu_b),
	 	._reg_write_data(_reg_write_data),
	 	._instr(_instr),
	 	._instr_addr(_instr_addr),
		.clock(clock),
		.reset(reset));
	
	always begin 
		#5 clock = ~clock;
	end
		
	initial begin
        clock = 1'b0; reset = 1'b1;
        
		 // wait for first negative edge before de-asserting reset
        @(negedge clock) reset = 1'b0;
        
		  #1000 $finish;
	end

endmodule 