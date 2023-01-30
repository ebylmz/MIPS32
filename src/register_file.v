module register_file(
    output [31:0] read_data_1,
    output [31:0] read_data_2,
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] write_reg,
    input [31:0] write_data,
    input write_enable,
    input clock);

    reg [31:0] registers [31:0];

    initial begin
		  $readmemh("D:/intelFPGA_lite/18.1/workspace/mips32/mem/reg.mem", registers);
    end	
	 
	 assign read_data_1 = registers[rs];
    assign read_data_2 = registers[rt];
	 
    always @ (posedge clock) begin
        if (write_enable & write_reg != 5'b0) begin
            registers[write_reg] = write_data;
        end
    end

endmodule