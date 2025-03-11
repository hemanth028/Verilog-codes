module shift_reg(clk, rst, en, mode, d, sin, sout, out);
parameter WIDTH = 4;
output reg [WIDTH-1:0] out;
input clk, rst, en;
input [1:0] mode;
input [WIDTH-1:0] d;
input sin, sout; //serial input and output

always @(posedge clk) begin
    if (rst) begin
        out <= 0;
    end else if (en) begin
        case (mode)
			2'b00:out<=out;
            2'b01: out <= {sin, out[WIDTH-1:1]};  // right shift 
            2'b10: out <= {out[WIDTH-2:0], sout}; // left shift
            2'b11: out <= d;                      // parallel load
        endcase
    end
end
endmodule

