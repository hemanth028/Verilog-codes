module adder(input a, b, cin, output cout, sum);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule

module add_sub(input [3:0] a, b, input control, output [3:0] result, output cout);
    wire [3:0] c1; // XORed version of b based on control (for subtraction)
    wire [3:0] w1; // Internal carry signals

    assign c1 = b ^ {4{control}};

    adder u1 (.a(a[0]), .b(c1[0]), .cin(control), .cout(w1[0]), .sum(result[0]));
    adder u2 (.a(a[1]), .b(c1[1]), .cin(w1[0]), .cout(w1[1]), .sum(result[1]));
    adder u3 (.a(a[2]), .b(c1[2]), .cin(w1[1]), .cout(w1[2]), .sum(result[2]));
    adder u4 (.a(a[3]), .b(c1[3]), .cin(w1[2]), .cout(cout), .sum(result[3]));
endmodule

