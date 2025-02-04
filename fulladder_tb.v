`include "fulladder.v"
module fulladder_tb;
reg a,b,cin;
wire sum ,cout;
    fulladder FA1 (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
initial begin
   repeat(2) begin
     a=$random;
     b=$random;
     cin=$random;
     # 1;
     $display("The value of a=%0d b=%0d cin=%0d",a,b,cin);
     $display("sum=%0d cout=%0d ",sum,cout);
   end
end
endmodule
