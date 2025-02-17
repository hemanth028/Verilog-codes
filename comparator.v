module comparator(
    input [3:0] a,
    input [3:0] b,
    output a_greater,
    output b_greater,
    output ab_equal
);

assign a_greater = (a > b);
assign b_greater = (b > a);
assign ab_equal = (a == b);

endmodule
