module right_shift2(
	output [31:0] shifted_data,
	input [31:0] data,
	input shift_enable);

	assign shifted_data[31] = shift_enable ? 1'b0 : data[31]; 
	assign shifted_data[30] = shift_enable ? 1'b0 : data[30]; 
	assign shifted_data[29] = shift_enable ? data[31] : data[29]; 
	assign shifted_data[28] = shift_enable ? data[30] : data[28]; 
	assign shifted_data[27] = shift_enable ? data[29] : data[27]; 
	assign shifted_data[26] = shift_enable ? data[28] : data[26]; 
	assign shifted_data[25] = shift_enable ? data[27] : data[25]; 
	assign shifted_data[24] = shift_enable ? data[26] : data[24]; 
	assign shifted_data[23] = shift_enable ? data[25] : data[23]; 
	assign shifted_data[22] = shift_enable ? data[24] : data[22]; 
	assign shifted_data[21] = shift_enable ? data[23] : data[21]; 
	assign shifted_data[20] = shift_enable ? data[22] : data[20]; 
	assign shifted_data[19] = shift_enable ? data[21] : data[19]; 
	assign shifted_data[18] = shift_enable ? data[20] : data[18]; 
	assign shifted_data[17] = shift_enable ? data[19] : data[17]; 
	assign shifted_data[16] = shift_enable ? data[18] : data[16]; 
	assign shifted_data[15] = shift_enable ? data[17] : data[15]; 
	assign shifted_data[14] = shift_enable ? data[16] : data[14]; 
	assign shifted_data[13] = shift_enable ? data[15] : data[13]; 
	assign shifted_data[12] = shift_enable ? data[14] : data[12]; 
	assign shifted_data[11] = shift_enable ? data[13] : data[11]; 
	assign shifted_data[10] = shift_enable ? data[12] : data[10]; 
	assign shifted_data[9] = shift_enable ? data[11] : data[9]; 
	assign shifted_data[8] = shift_enable ? data[10] : data[8]; 
	assign shifted_data[7] = shift_enable ? data[9] : data[7]; 
	assign shifted_data[6] = shift_enable ? data[8] : data[6]; 
	assign shifted_data[5] = shift_enable ? data[7] : data[5]; 
	assign shifted_data[4] = shift_enable ? data[6] : data[4]; 
	assign shifted_data[3] = shift_enable ? data[5] : data[3]; 
	assign shifted_data[2] = shift_enable ? data[4] : data[2]; 
	assign shifted_data[1] = shift_enable ? data[3] : data[1]; 
	assign shifted_data[0] = shift_enable ? data[2] : data[0]; 

endmodule