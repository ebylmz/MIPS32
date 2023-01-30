module half_adder(
    output sum,
    output carry,
    input a,
    input b);
    
    assign sum = a ^ b;
    assign carry = a & b;

endmodule