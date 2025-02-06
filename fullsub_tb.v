`include "fullsub.v"
module fullsub_tb;
    reg a, b, bin;
    wire borrow, diff;
    fullsub dut (.a(a), .b(b), .bin(bin), .diff(diff), .borrow(borrow));

    initial begin
        repeat (3) begin
            {a, b, bin} = $random;
            #1;
            $display("The value of a, b, bin is a=%0d b=%0d bin=%0d", a, b, bin);
            $display("The difference and borrow are diff=%0d borrow=%0d", diff, borrow);
        end
    end
endmodule




