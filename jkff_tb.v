`include "jkff.v"
module jkff_tb;
    reg j, k;
    reg clk,rst;
    wire q,qbar;
    jkff dut (.j(j),.k(k),.clk(clk),.rst(rst),.q(q),.qbar(qbar));
    always #5 clk = ~clk;
    initial begin 
        clk = 0;
        rst = 1;
        j = 0;
        k= 0;
        #10 rst = 0;
        forever begin
            #5 {j, k} = $random;
            $monitor("time=%0t j=%0b k=%0b q=%0b qbar=%0b", $time, j, k, q, qbar);
         end
        end
    initial begin
        #100 $finish;end
endmodule
