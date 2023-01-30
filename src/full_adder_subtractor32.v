module full_adder_subtractor32(
	output [31:0] sum,
	output cout,
	input [31:0] a,
	input [31:0] b,
	input cin,
	input sub_en);
	
	wire [6:0] carry;

	full_adder_subtractor4 adder1(
		.sum(sum[3:0]),
		.cout(carry[0]),
		.a(a[3:0]),
		.b(b[3:0]),
		.cin(cin),
		.sub_en(sub_en));

	full_adder_subtractor4 adder2(
		.sum(sum[7:4]),
		.cout(carry[1]),
		.a(a[7:4]),
		.b(b[7:4]),
		.cin(carry[0]),
		.sub_en(sub_en));

	full_adder_subtractor4 adder3(
		.sum(sum[11:8]),
		.cout(carry[2]),
		.a(a[11:8]),
		.b(b[11:8]),
		.cin(carry[1]),
		.sub_en(sub_en));

	full_adder_subtractor4 adder4(
		.sum(sum[15:12]),
		.cout(carry[3]),
		.a(a[15:12]),
		.b(b[15:12]),
		.cin(carry[2]),
		.sub_en(sub_en));

	full_adder_subtractor4 adder5(
		.sum(sum[19:16]),
		.cout(carry[4]),
		.a(a[19:16]),
		.b(b[19:16]),
		.cin(carry[3]),
		.sub_en(sub_en));

	full_adder_subtractor4 adder6(
		.sum(sum[23:20]),
		.cout(carry[5]),
		.a(a[23:20]),
		.b(b[23:20]),
		.cin(carry[4]),
		.sub_en(sub_en));

	full_adder_subtractor4 adder7(
		.sum(sum[27:24]),
		.cout(carry[6]),
		.a(a[27:24]),
		.b(b[27:24]),
		.cin(carry[5]),
		.sub_en(sub_en));

	full_adder_subtractor4 adder8(
		.sum(sum[31:28]),
		.cout(cout),
		.a(a[31:28]),
		.b(b[31:28]),
		.cin(carry[6]),
		.sub_en(sub_en));

endmodule