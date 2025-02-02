module gates(input a, b,
             output and_gate,
             output or_gate,
             output not_gate,
             output xor_gate,
             output nand_gate,
             output nor_gate,
             output xnor_gate);

// Dataflow method
assign and_gate = a & b;
assign or_gate = a | b;
assign not_gate = ~a;
assign xor_gate = a ^ b;
assign nand_gate = ~(a & b);
assign nor_gate = ~(a | b);
assign xnor_gate = ~(a ^ b);

/* Gate-level method
and (and_gate, a, b);
or (or_gate, a, b);
not (not_gate, a);
xor (xor_gate, a, b);
nand (nand_gate, a, b);
nor (nor_gate, a, b);
xnor (xnor_gate, a, b);
*/
endmodule

