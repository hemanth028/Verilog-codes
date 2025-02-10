`include "add_sub.v"

module add_sub_tb;

reg [3:0] a, b;
reg control;
wire [3:0] result;
wire cout;

add_sub dut(.a(a), .b(b), .control(control), .result(result), .cout(cout));

initial begin
    repeat(3) begin
        {a, b, control} = $random;
        #1;
        if (control == 0)
            $display(" control input is control=%0d \nAddition: %0d + %0d = %0d",control, a, b, result);
        else
            $display("control input is control=%0d \nSubtraction: %0d - %0d = %0d",control, a, b, result);
    end
end

endmodule

