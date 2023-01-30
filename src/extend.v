module extend(
	output reg [31:0] extended_data,
	input sign_ext_enable,
	input [15:0] data); 

	always @(*) begin
		if (sign_ext_enable & data[15])
			extended_data = {16'hFFFF, data};
	  else
			extended_data = {16'h0000, data};
	end
		
endmodule