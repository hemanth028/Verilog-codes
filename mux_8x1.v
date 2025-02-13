`include "mux4x1.v"

module mux2x1(
    input a,
    input b,
    input s,
    output out
);

assign out = s ? b : a;

endmodule

/*module mux4x1(
    input [3:0] a,
    input [1:0] s,
    output out
);

assign out = (s == 2'b00) ? a[0] :
             (s == 2'b01) ? a[1] :
             (s == 2'b10) ? a[2] :
             a[3];

endmodule
*/
module mux8x1(
    input [7:0] a,
    input [2:0] sel,
    output out
);

wire y0, y1;

mux4x1 u1 (.a(a[3:0]), .s(sel[1:0]), .out(y0));
mux4x1 u2 (.a(a[7:4]), .s(sel[1:0]), .out(y1));
mux2x1 u3 (.a(y0), .b(y1), .s(sel[2]), .out(out));

endmodule

