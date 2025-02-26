module mealy_overlap_10110(
    input wire clk,
    input wire rst,
    input wire in_data,
    output reg out_data
);

    // State Encoding
    parameter s0 = 3'b000;
    parameter s1 = 3'b001;
    parameter s10 = 3'b010;
    parameter s101 = 3'b011;
    parameter s1011 = 3'b100;
    parameter s10110 = 3'b101; // Final state when 10110 is detected

    reg [2:0] state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= s0;
            out_data <= 0;
        end else begin
            case (state)
                s0: begin
                    if (in_data) state <= s1;
                    else state <= s0;
                    out_data <= 0;
                end
                s1: begin
                    if (!in_data) state <= s10;
                    else state <= s1;
                    out_data <= 0;
                end
                s10: begin
                    if (in_data) state <= s101;
                    else state <= s0;
                    out_data <= 0;
                end
                s101: begin
                    if (in_data) state <= s1011;
                    else state <= s10;
                    out_data <= 0;
                end
                s1011: begin
                    if (!in_data) state <= s10110;
                    else state <= s1; // Overlapping sequence handling
                    out_data <= 0;
                end
                s10110: begin
                    out_data <= 1; // Sequence detected
                    if (in_data) state <= s1;
                    else state <= s10;
                end
            endcase
        end
    end

endmodule

