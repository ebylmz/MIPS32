module shifter(
	output [31:0] shifted_data,
	input [31:0] data,
	input [4:0] shamt,
    input left_shift_enable);

    wire [31:0] shifted [4:0]; 
    wire [31:0] shifter_in, reversed_in, reversed_out;

    bit_reverser reverser1(
	    .reversed_data(reversed_in),
	    .data(data));

    // reverse the data for left shift 
    assign shifter_in = left_shift_enable ? reversed_in : data;

    right_shift shift1(
	    .shifted_data(shifted[0]),
	    .data(shifter_in),
	    .shift_enable(shamt[0]));

    right_shift2 shift2(
	    .shifted_data(shifted[1]),
	    .data(shifted[0]),
	    .shift_enable(shamt[1]));

    right_shift4 shift4(
	    .shifted_data(shifted[2]),
	    .data(shifted[1]),
	    .shift_enable(shamt[2]));

    right_shift8 shift8(
	    .shifted_data(shifted[3]),
	    .data(shifted[2]),
	    .shift_enable(shamt[3]));

    right_shift16 shift16(
	    .shifted_data(shifted[4]),
	    .data(shifted[3]),
	    .shift_enable(shamt[4]));

    bit_reverser reverse2(
	    .reversed_data(reversed_out),
	    .data(shifted[4]));

    // reverse the data for left shift 
    assign shifted_data = left_shift_enable ? reversed_out : shifted[4];

endmodule