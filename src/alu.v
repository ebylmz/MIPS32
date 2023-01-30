module alu(
	output reg [31:0] result_lo,
	output reg [31:0] result_hi,
	output zero,
	input [31:0] a,
	input [31:0] b,
	input [4:0] shamt,
	input [2:0] alu_ctr);
	
	localparam 	ADD = 3'b000, 
					SUB = 3'b001, 
					MULT = 3'b010, 
					AND = 3'b011, 
					OR = 3'b100, 
					SLT = 3'b101, 
					SRL = 3'b110, 
					SLL = 3'b111;

	wire [31:0] wr_add, wr_and, wr_or, wr_slt, wr_shift;
	wire [63:0] wr_mult;
	wire overflow, left_shift_enable, sub_enable;

	assign sub_enable = (alu_ctr == SUB | alu_ctr == SLT); 
	assign left_shift_enable = (alu_ctr == SLL);
	
	full_adder_subtractor32 adder(
		.sum(wr_add),
		.cout(overflow),
		.a(a),
		.b(b),
		.cin(sub_enable),
		.sub_en(sub_enable));

	shifter right_left_shift(
		.shifted_data(wr_shift),
		.data(a),
		.shamt(shamt),
		.left_shift_enable(left_shift_enable));
	
	assign wr_and = a & b;
	assign wr_or = a | b;
	assign wr_mult = a * b;
	assign wr_slt = {31'b0, wr_add[31]};
	assign zero = ~|wr_add; 

	always @ (*) begin
		result_hi = 32'b0;
		
		case (alu_ctr) 
			ADD, 
			SUB: begin
				result_lo <= wr_add;  
			end
			
			MULT: begin 
				result_hi <= wr_mult[63:32]; 
				result_lo <= wr_mult[31:0];  
			end
				
			AND: begin
				result_lo <= wr_and;  
			end
			
			OR: begin
				result_lo <= wr_or;  
			end
			
			SLT: begin
				result_lo <= wr_slt;  
			end
			
			SRL,
			SLL: begin
				result_lo <= wr_shift; 
			end
		endcase
	end

endmodule