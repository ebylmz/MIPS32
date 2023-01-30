module data_memory(
	output reg [31:0] mem_out,
	input [31:0] address,
	input [31:0] write_data,
	input write_enable,
	input read_enable,
	input clock);

	reg [31:0] memory [127:0];
	
	initial begin
		$readmemh("D:/intelFPGA_lite/18.1/workspace/mips32/mem/data.mem", memory);
	end
		  
	always @ (*) begin
		if (read_enable)
			mem_out <= memory[address];
		else 
			mem_out <= 32'b0;
	end
	
	always @ (posedge clock) begin
		if (write_enable)
			memory[address] <= write_data;
	end
		
endmodule