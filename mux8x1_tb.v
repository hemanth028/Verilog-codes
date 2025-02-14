`include"mux_8x1.v"
`include"mux4x1.v"

module mux8x1_tb;
reg[7:0]a;
reg[2:0]sel;
wire out;

mux8x1 dut(.a(a),.sel(sel),.out(out));
initial begin
	repeat(3)begin
		a=$urandom;
		sel=$urandom;
		#1;
		$display("The value of a is a=%0b\nThe sel value is sel=%0b\nThe out value is out=%0b\n\n ",a,sel,out);
	end
end
endmodule
