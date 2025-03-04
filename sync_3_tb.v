`include "sync_3.v"
module sync_3_tb;
    reg clk, reset;
    wire [2:0] count;

    sync_3 dut(
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    initial begin
        clk = 0;
        reset = 1;
        #10 reset = 0;
        #200 $finish;
    end

    always #5 clk = ~clk;

    initial begin
        $monitor("Time = %0t, Count = %b", $time, count);
    end
endmodule

