module program_counter(
	output reg [31:0] pc,
	input beq,
	input bne,
	input zero,
	input j,
	input jr,
	input jal,
	input [31:0] branch_addr,	
	input [31:0] jump_addr_reg, 
	input [25:0] jump_addr_imm, 
	input clock,
	input reset);

	reg [31:0] pc_next = 32'h0;

	always @ (posedge clock) begin
		pc <= reset ? 32'h0 : pc_next;
	end 

	always @ (*) begin
		if ((beq & zero) | (bne & ~zero))
			pc_next = pc + 32'b1 + branch_addr;
		else if (jr)
			pc_next = jump_addr_reg; 
		else if (j | jal)
			pc_next = {pc[31:26], jump_addr_imm}; 
		else 
			pc_next = pc + 32'h1;
	end


endmodule 