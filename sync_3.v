module jk_ff(
    input j, k, clk, reset,
    output reg q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            case ({j, k})
                2'b00: q <= q;    
                2'b01: q <= 1'b0; 
                2'b10: q <= 1'b1;
                2'b11: q <= ~q;   
            endcase
    end
endmodule
module sync_3(
    input clk, reset,
    output [2:0] count
);
    wire q0, q1, q2;
    jk_ff ff0(.j(1'b1), .k(1'b1), .clk(clk), .reset(reset), .q(q0));
    jk_ff ff1(.j(q0), .k(q0), .clk(clk), .reset(reset), .q(q1));
    jk_ff ff2(.j(q1), .k(q1), .clk(clk), .reset(reset), .q(q2));
    assign count = {q2, q1, q0};  
endmodule

