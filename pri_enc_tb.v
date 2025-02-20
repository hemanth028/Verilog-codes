`include "priority_enc.v"
module pri_enc_tb;
  reg [7:0] d;
  wire [2:0] out;
  pri_enc dut (.d(d),.out(out));
  initial begin
    repeat(10) begin
      d = $random;
      #1;
      $display("Test: d=%b, out=%b", d, out);
    end
  end
endmodule

