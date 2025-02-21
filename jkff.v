module jkff(
    input j, k,
    input clk,
    input rst,
    output reg q,
    output qbar);
always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= 0;
    end else begin
        case ({j, k})
            2'b00: q <= q;
            2'b01: q <= 0;
            2'b10: q <= 1;
            2'b11: q <= ~q;
            default: q <= q;
        endcase
    end
end
assign qbar = ~q;
endmodule

