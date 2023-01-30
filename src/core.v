module core(
	output [31:0] pc,
	output dmem_read, 
	output dmem_write,
	output [31:0] dmem_addr,
	output [31:0] dmem_write_data,
	input [31:0] instr,
	input [31:0] dmem_read_data,
	input clock,
	input reset);

	
	wire alu_src, beq, bne, j, jr, jal, li, hi_lo_write, from_hi_lo, sel_hi_lo, mem_to_reg, reg_dst, reg_write; 
	wire [2:0] alu_ctr;
	
	wire [5:0] opcode, func;
	wire [4:0] rs, rt, rd, shamt;
	wire [15:0] immediate;
	wire [25:0] address;

	wire [31:0] ext_immediate, alu_b, alu_result_hi, alu_result_lo;
	wire zero;

	wire [31:0] reg_write_data, rs_content, rt_content, hi_lo_reg;
	wire [4:0] write_reg, dest_reg;
	
	// special purpose hi and lo registers
	reg [31:0] hi = 32'b0, lo = 32'b0; 
		
	program_counter pcounter(
		.pc(pc),
		.beq(beq),
		.bne(bne),
		.zero(zero),
		.j(j),
		.jr(jr),
		.jal(jal),
		.branch_addr(ext_immediate),	
		.jump_addr_reg(rs_content), 
		.jump_addr_imm(address), 
		.clock(clock),
		.reset(reset));
	
	instr_decoder idec(
		.opcode(opcode),
		.rs(rs),
		.rt(rt),
		.rd(rd),
		.shamt(shamt),
		.func(func),
		.immediate(immediate),
		.address(address),
		.instr(instr));
	
	control_unit control(
		.alu_ctr(alu_ctr),
		.alu_src(alu_src),
		.beq(beq),
		.bne(bne),
		.j(j),
		.jr(jr),
		.jal(jal),
		.li(li),
		.hi_lo_write(hi_lo_write),
		.from_hi_lo(from_hi_lo),
		.sel_hi_lo(sel_hi_lo),
		.mem_read(dmem_read),
		.mem_write(dmem_write),
		.mem_to_reg(mem_to_reg),
		.reg_dst(reg_dst),
		.reg_write(reg_write),
		.opcode(opcode),
		.func(func));
	
	register_file reg_file(
		.read_data_1(rs_content),
		.read_data_2(rt_content),
		.rs(rs),
		.rt(rt),
		.write_reg(write_reg),
		.write_data(reg_write_data),
		.write_enable(reg_write),
		.clock(clock));

	extend sign_ext(
		.extended_data(ext_immediate),
		.sign_ext_enable(1'b1),
		.data(immediate));
		
	alu arithmetic_logic_unit(
		.result_lo(alu_result_lo),
		.result_hi(alu_result_hi),
		.zero(zero),
		.a(rs_content),  
		.b(alu_b),
		.shamt(shamt),
		.alu_ctr(alu_ctr));
	
	always @ (posedge clock) begin 
		if (hi_lo_write) begin
			hi <= alu_result_hi;
			lo <= alu_result_lo;
		end
	end
	
	assign write_reg = jal ? 5'd31 : (reg_dst ? rd : rt);
	
	assign alu_b = alu_src ? ext_immediate : rt_content;
	
	assign dmem_addr = alu_result_lo;
	assign dmem_write_data = rs_content; 
	assign hi_lo_reg = sel_hi_lo ? hi : lo;
	assign reg_write_data = li ? ext_immediate : (mem_to_reg ? dmem_read_data : (from_hi_lo ?  hi_lo_reg: alu_result_lo));

endmodule 