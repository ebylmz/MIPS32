module register_file_tb();
	
	wire [31:0] read_data_1, read_data_2;
	reg [4:0] rs, rt, write_reg;
	reg [31:0] write_data;
	reg clock = 1'b0;
	reg write_enable;

	register_file regfile(
		 .read_data_1(read_data_1),
		 .read_data_2(read_data_2),
		 .rs(rs),
		 .rt(rt),
		 .write_reg(write_reg),
		 .write_data(write_data),
		 .write_enable(write_enable),
		 .clock(clock));
	

	always begin
		#5 clock = ~clock;
	end
	
	initial begin
		
		rs = 5'h0;
		rt = 5'h0; 
		write_reg = 5'h0;
		write_data = 32'b0;
		write_enable = 1'b0;
		
		#5 rs = 5'h1; rt = 5'h2;
		#10 rs = 5'h3; rt = 5'h4;
		#10 rs = 5'h5; rt = 5'h6;
		#10 rs = 5'h7; rt = 5'h8;
		#10 rs = 5'h9; rt = 5'hA;
		
		#10 write_reg = 5'h10; write_data = 32'hFFFF_FFFF; write_enable = 1'b1;
		#10 write_reg = 5'h11; write_data = 32'hFFFF_EEEE; 
		#10 write_reg = 5'h12; write_data = 32'hEEEE_DDDD; 
		#10 write_reg = 5'h13; write_data = 32'hDDDD_CCCC; 
		
		
		#10 rs = 5'h10; rt = 5'h11; write_enable = 1'b0;
		#10 rs = 5'h12; rt = 5'h13;
		
	end
	
endmodule 