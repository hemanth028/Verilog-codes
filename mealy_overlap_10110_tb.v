`include "mealy_overlap_10110.v"
module mealy_overlap_10110_tb;
    reg clk;
    reg rst;
    reg in_data;
    wire out_data;
    
    mealy_overlap_10110 dut(.clk(clk), .rst(rst), .in_data(in_data), .out_data(out_data));

    always #5 clk = ~clk;  // Generate a clock with a period of 10 time units

    initial begin
        $display("Time  | clk | rst | in_data | out_data");
        $display("----------------------------------------");
        $monitor("%0t  |  %b    |    %b    |     %b    |    %b", $time, clk, rst, in_data, out_data);
        
        // Initialize values
        clk = 0;
        rst = 1;
        in_data = 0;

        // Apply reset
        repeat(2) @(posedge clk);
        rst = 0;

        // Input sequence: 10110 (should trigger out_data = 1)
        @(posedge clk); in_data = 1;
        @(posedge clk); in_data = 0;
        @(posedge clk); in_data = 1;
        @(posedge clk); in_data = 1;
        @(posedge clk); in_data = 0;  // Output should go high here if FSM works correctly
        
        // Wait a few clock cycles to observe stability
        repeat(3) @(posedge clk);
        
        // Apply another instance of 10110 to check overlapping sequence detection
        @(posedge clk); in_data = 1;
        @(posedge clk); in_data = 0;
        @(posedge clk); in_data = 1;
        @(posedge clk); in_data = 1;
        @(posedge clk); in_data = 0;  // Output should go high here again

        repeat(3) @(posedge clk);
        
        $finish;
    end
endmodule

