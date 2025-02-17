`include "comparator.v"
module comp_tb;
  reg [3:0] a;
  reg [3:0] b;
  wire a_greater, b_greater, ab_equal;
//instantiation
  comparator dut (.a(a),.b(b),.a_greater(a_greater),.b_greater(b_greater),.ab_equal(ab_equal));

  initial begin
    repeat (2) begin
      {a, b} = $random;
      #1;
      $display("a=%0b b=%0b a_greater=%0b b_greater=%0b ab_equal=%0b", a, b, a_greater, b_greater, ab_equal);
    end
  end
endmodule

