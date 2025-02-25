module tff(
    input t,
    input clk,
    input rst,
    output reg q,
    output qbar
);
always @(posedge clk) begin
    if (rst) begin
        q <= 1'b0;
    end else begin
        if (t == 1'b1)
            q <= ~q;
    end
end

assign qbar = ~q;

endmodule

