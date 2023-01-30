module alu_tb();
	reg [31:0] a, b;
	reg [2:0] alu_ctr;
	reg [4:0] shamt;
	wire [31:0] result_lo, result_hi;
	wire zero;

	alu arithmetic_logic_unit(
		.result_lo(result_lo),
		.result_hi(result_hi),
		.zero(zero),
		.a(a),  
		.b(b),
		.shamt(shamt),
		.alu_ctr(alu_ctr));

	initial begin
		// add
		alu_ctr = 3'b000; a = 32'd120; b = 32'd55;
		
		// sub
		#20 alu_ctr = 3'b001; a = 32'd180; b = 32'd42; 

		// mult
		#20 alu_ctr = 3'b010; a = 32'd12; b = 32'd25;
		
		// and
		#20 alu_ctr = 3'b011; a = 32'b1111_0000_1111_1101_1111_0000_1111_1101; b = 32'b1111_0000_1111_1100_1111_0000_1111_1100;
	
		// or
		#20 alu_ctr = 3'b100; a = 32'b1111_0000_0000_1101_1111_0000_0000_1101; b = 32'b0011_0000_0000_1100_0011_0000_0000_1100;
		
		// slt
		#20 alu_ctr = 3'b101; a = 32'b0000_0000_0000_0000_0011_0000_0000_1101; b = 32'b0000_0000_0000_1100_0000_0000_0000_1100;
		
		// srl
		#20 alu_ctr = 3'b110; a = 32'b0000_0000_1111_1111_0000_0000_1111_1111; shamt = 5'd3;
		
		// sll
		#20 alu_ctr = 3'b111; a = 32'b0000_0000_0000_1111_0000_0000_0000_1111; shamt = 5'd18;
		
		#20;
	end
			
	initial begin
		$monitor("time = %5d, alu_ctr = %3b, a = %32b, b = %32b, result_hi = %32b, result_lo = %32b", $time, alu_ctr, a, b, result_hi, result_lo);
	end
	

endmodule