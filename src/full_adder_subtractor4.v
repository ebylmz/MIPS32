module full_adder_subtractor4(
	output [3:0] sum,
	output cout,
	input [3:0] a,
	input [3:0] b,
	input cin,
	input sub_en);
	
	wire [2:0] carry;

	full_adder_subtractor adder1(
		.sum(sum[0]),
		.cout(carry[0]),
		.a(a[0]),
		.b(b[0]),
		.cin(cin),
		.sub_en(sub_en));

	full_adder_subtractor adder2(
		.sum(sum[1]),
		.cout(carry[1]),
		.a(a[1]),
		.b(b[1]),
		.cin(carry[0]),
		.sub_en(sub_en));

	full_adder_subtractor adder3(
		.sum(sum[2]),
		.cout(carry[2]),
		.a(a[2]),
		.b(b[2]),
		.cin(carry[1]),
		.sub_en(sub_en));

	full_adder_subtractor adder4(
		.sum(sum[3]),
		.cout(cout),
		.a(a[3]),
		.b(b[3]),
		.cin(carry[2]),
		.sub_en(sub_en));

endmodule