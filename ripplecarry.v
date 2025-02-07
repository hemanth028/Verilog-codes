module adder(input a, b, cin, output cout, sum);
    
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));

endmodule

module ripcaradd(a, b, cin, sum, cout);
    input [3:0] a, b;
    input cin;
    output [3:0] sum;
    output cout;
    wire [3:0] w1;

    // Instantiating
    adder u1(a[0], b[0], cin, w1[0], sum[0]);
    adder u2(a[1], b[1], w1[0], w1[1], sum[1]);
    adder u3(a[2], b[2], w1[1], w1[2], sum[2]);
    adder u4(a[3], b[3], w1[2], cout, sum[3]);

endmodule

