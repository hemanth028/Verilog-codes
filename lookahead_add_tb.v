`include "lookahead.v"

module lookahead_add_tb;
    reg [3:0] A, B;
    reg cin;
    wire [3:0] sum;
    wire cout;

    lookahead_add dut (.A(A), .B(B), .Cin(cin), .Sum(sum), .Cout(cout));

    initial begin
        repeat(5) begin
            {A, B, cin} = $random;
            #5; 
            $display("A=%b B=%b Cin=%b || Sum=%b Cout=%b", A, B, cin, sum, cout);
        end
    end
endmodule

