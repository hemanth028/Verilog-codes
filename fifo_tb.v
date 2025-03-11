`include"fifo.v"
module fifo_tb;
parameter WIDTH = 16;
parameter DEPTH = 16;
parameter PTR_WIDTH = $clog2(DEPTH);

reg wr_clk_i, rd_clk_i, rst_i, wr_en_i, rd_en_i;
reg [WIDTH-1:0] wdata_i;
wire [WIDTH-1:0] rdata_o;
wire wr_error_o, rd_error_o, full_o, empty_o;

integer i;

fifo dut (
    .wr_clk_i(wr_clk_i),
    .rd_clk_i(rd_clk_i),
    .rst_i(rst_i),
    .wr_en_i(wr_en_i),
    .rd_en_i(rd_en_i),
    .wdata_i(wdata_i),
    .rdata_o(rdata_o),
    .wr_error_o(wr_error_o),
    .rd_error_o(rd_error_o),
    .full_o(full_o),
    .empty_o(empty_o)
);

initial begin
    wr_clk_i = 0;
    forever #5 wr_clk_i = ~wr_clk_i;
end

initial begin
    rd_clk_i = 0;
    forever #7 rd_clk_i = ~rd_clk_i;
end

initial begin
    rst_i = 1;
    repeat (2) @(posedge wr_clk_i);
    rst_i = 0;
    write_logic();
    read_logic();
    #150;
    $finish;
end

task write_logic();
begin
    for (i = 0; i <= DEPTH; i = i + 1) begin
        @(posedge wr_clk_i);
        wr_en_i = 1;
        wdata_i = $random;
    end
    @(posedge wr_clk_i);
    wr_en_i = 0;
    wdata_i = 0;
end
endtask

task read_logic();
begin
    for (i = 0; i <= DEPTH; i = i + 1) begin
        @(posedge rd_clk_i);
        rd_en_i = 1;
    end
    rd_en_i = 0;
end
endtask

endmodule

