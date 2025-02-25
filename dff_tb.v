`include "dff.v"
module dff_tb();
    reg d;
    reg clk;
    reg rst;
    wire q, qbar;
    dff dut (
        .d(d),
        .clk(clk),
        .rst(rst),
        .q(q),
        .qbar(qbar)
    );
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst = 1;
        d = 0;
        #10 rst = 0;
        #5 rst = 1;
        forever begin
            d = $random;
            #1;
            $display("rst=%0b TIME=%0t d=%0d q=%0b  qbar=%0b",rst, $time,d, q, qbar);
        #150 $finish;
    end
end
endmodule

