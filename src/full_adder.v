module full_adder(
	output sum,
	output cout,
	input a,
	input b,
	input cin);

	wire cout0, cout1, out;

	half_adder adder1(
		.sum(out), 
		.carry(cout0),
		.a(a), 
		.b(b)); 
	
	half_adder adder2(
		.sum(sum), 
		.carry(cout1),
		.a(out), 
		.b(cin)); 

    assign cout = cout0 | cout1;

endmodule