`include "tff.v"
module tff_tb;
    reg t, clk, rst;
    wire q, qbar;
    tff dut (.t(t), .clk(clk), .rst(rst), .q(q), .qbar(qbar));
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst = 0;
        #5 rst = 1;
        #5 rst = 0;
        #5 rst = 1;
        t = 0; 
        forever begin
            t = $random;
            #5;
            $display("Time=%0t t=%0b q=%0b qbar=%0b", $time, t, q, qbar);
        end
    end
    initial begin
        #100 $finish;
    end
endmodule

