`include "deci_bcd.v"

module deci_bcd_tb();
    reg [9:0] a;
    wire [2:0] out;

    deci_bcd dut(.a(a), .out(out));

    initial begin
        $monitor("Time = %0t | Decimal = %0d | BCD = %0b", $time, a, out);
        repeat(5) begin
            a = $urandom % 10;//ensures the value is from 0 to 10
            #1;
        end
        #5 $finish;
    end
endmodule



