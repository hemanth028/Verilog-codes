`include "gates.v"
module gates_tb;
reg a, b;
wire and_gate, or_gate, not_gate, xor_gate, nand_gate, nor_gate, xnor_gate;
gates dut (
    .a(a),
    .b(b),
    .and_gate(and_gate),
    .or_gate(or_gate),
    .not_gate(not_gate),
    .xor_gate(xor_gate),
    .nand_gate(nand_gate),
    .nor_gate(nor_gate),
    .xnor_gate(xnor_gate)
);

initial begin
	repeat(2)begin
    a = $random;
    b = $random;
    #1;
	$display("a=%0d b=%0d",a,b);
    $display("and=%0d or=%0d not=%0d xor=%0d nand=%0d nor=%0d xnor=%0d", and_gate, or_gate, not_gate, xor_gate, nand_gate, nor_gate, xnor_gate);
end
end
endmodule

