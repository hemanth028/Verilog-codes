module fulladder(input a, b, cin,
                 output sum, cout);

//using dataflow method
assign sum = a ^ b ^ cin;
assign cout = (a & b) | ((a ^ b) & cin);

//alternative way
//assign {cout,sum}=a+b+cin;
endmodule

