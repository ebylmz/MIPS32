module bit_reverser(
	output reg [31:0] reversed_data,
	input [31:0] data);
    
	integer i;

	always @ (*) begin
		for (i = 0; i < 32; i = i + 1) begin
			reversed_data[31 - i] = data[i];
		end
	end
	
endmodule