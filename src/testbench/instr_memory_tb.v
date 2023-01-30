module instr_memory_tb();

    wire [31:0] mem_out;
    reg [31:0] address;
    reg clock = 1'b0;

    instr_mem imem(
        .mem_out(mem_out),
        .address(address),
        .clock(clock));

    always begin 
        #5 clock = ~clock;
    end

    initial begin
        address = 32'h0;
        #10 address = 32'h1;
        #10 address = 32'h2;
        #10 address = 32'h3;
        #10 address = 32'h4;
        #10 address = 32'h5;
        #10 address = 32'h6;
    end


endmodule