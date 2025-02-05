module fullsub(input a, b, bin,
               output diff, borrow);

// Using dataflow method
assign diff = a ^ b ^ bin;
assign borrow = (~a & b) | (~a & bin) | (b & bin);

endmodule

