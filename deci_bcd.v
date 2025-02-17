module deci_bcd(
    input [9:0] a,
    output reg [2:0] out
);

always @(*) begin
    case(a)
        10'b0000000000: out = 3'b000; 
        10'b0000000001: out = 3'b001; 
        10'b0000000010: out = 3'b010; 
        10'b0000000011: out = 3'b011; 
        10'b0000000100: out = 3'b100; 
        10'b0000000101: out = 3'b101; 
        10'b0000000110: out = 3'b110; 
        10'b0000000111: out = 3'b111;         
		default: out = 3'b000;      
    endcase
end

endmodule

