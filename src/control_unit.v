module control_unit(
	output reg [2:0] alu_ctr,
	output alu_src,
	output beq,
	output bne,
	output j,
	output jr,
	output jal,
	output li,
	output hi_lo_write,
	output from_hi_lo,
	output sel_hi_lo,
	output mem_read,
	output mem_write,
	output mem_to_reg,
	output reg_dst,
	output reg_write,
	input [5:0] opcode,
	input [5:0] func);
	
	localparam 	ADD = 3'b000, 
					SUB = 3'b001, 
					MULT = 3'b010,
					AND = 3'b011, 
					OR = 3'b100, 
					SLT = 3'b101, 
					SRL = 3'b110, 
					SLL = 3'b111;

	wire is_r_type, is_i_type;
	
	// R-type instructions
	wire is_add, is_sub, is_mult, is_slt, is_and, is_or, is_sll, is_srl, is_jr, is_mfhi, is_mflo; 
	
	// I-type instructions
	wire is_addi, is_andi, is_ori, is_slti, is_sw, is_lw, is_li, is_beq, is_bne;
	
	// J-type instructions
	wire is_j, is_jal;
		
	assign is_r_type = (opcode == 6'h00);
	
	assign is_lw = (opcode == 6'h23);
	assign is_sw = (opcode == 6'h2b);
	
	assign is_sub = (is_r_type & func == 6'h22);
	
	assign is_mult = (is_r_type  & func == 6'h18);
	
	assign is_jr = (is_r_type  & func == 6'h08);
	assign is_j = (opcode == 6'h02);
	assign is_jal = (opcode == 6'h03);
	
	assign is_mfhi = (is_r_type  & func == 6'h10);
	assign is_mflo = (is_r_type  & func == 6'h12);

	assign is_add = (is_r_type  & func == 6'h20);
	assign is_addi = (opcode == 6'h08);
	
	assign is_and = (is_r_type  & func == 6'h24);
	assign is_andi = (opcode == 6'h0c);
	
	assign is_sll = (is_r_type  & func == 6'h00);
	assign is_srl = (is_r_type  & func == 6'h02);
	
	assign is_or = (is_r_type  & func == 6'h25);
	assign is_ori = (opcode == 6'h0d);
	
	assign is_slt = (is_r_type  & func == 6'h2a);
	assign is_slti = (opcode == 6'h0a);
	
	assign is_beq = (opcode == 6'h04);
	assign is_bne = (opcode == 6'h05);
	
	assign is_li = (opcode == 6'h07);
	
	assign is_i_type = is_addi | is_andi | is_ori | is_slti | is_sw | is_lw | is_beq | is_bne | is_li;
	
	assign reg_dst = is_r_type; 
	assign beq = is_beq;
	assign bne = is_bne;
	assign mem_read = is_lw;
	assign mem_to_reg = is_lw; 
	assign mem_write = is_sw;
	assign alu_src = is_i_type & ~(is_beq | is_bne); 
	assign reg_write = (is_r_type & ~is_jr & ~is_mult) | (is_i_type & ~(is_beq | is_bne) | is_jal);
	assign j = is_j;
	assign jr = is_jr;
	assign jal = is_jal;
	assign li = is_li;
	
	assign hi_lo_write = is_mult;
	assign from_hi_lo = is_mfhi | is_mflo;
	assign sel_hi_lo = is_mfhi;

	always @ (*) begin		
		if (is_add | is_addi | is_lw | is_sw)
			alu_ctr = ADD;
		else if (is_sub | is_bne | is_beq)
			alu_ctr = SUB;
		else if (is_mult)
			alu_ctr = MULT;
		else if (is_and | is_andi)
			alu_ctr = AND;
		else if (is_or | is_ori)
			alu_ctr = OR;
		else if (is_slt | is_slti)
			alu_ctr = SLT;
		else if (is_srl)
			alu_ctr = SRL;
		else if (is_sll)
			alu_ctr = SLL;
		else
			alu_ctr = ADD;
	end

endmodule 