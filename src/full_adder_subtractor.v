module full_adder_subtractor(
	output sum,
	output cout,
	input a,
	input b,
	input cin,
	input sub_en);

	wire b_xor;

	assign b_xor = b ^ sub_en; 

 	full_adder fa(
		.sum(sum),
		.cout(cout),
		.a(a),
		.b(b_xor),
		.cin(cin));

endmodule