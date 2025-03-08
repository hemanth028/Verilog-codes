`include "single_port_ram.v"
module single_port_ram_tb;

parameter DEPTH = 16;
parameter WIDTH = 8;
parameter ADDR_WIDTH = 4;

reg clk, rst, wr_rd, valid;
reg [WIDTH-1:0] wdata;
reg [ADDR_WIDTH-1:0] addr;
wire [WIDTH-1:0] rdata;
wire ready;
integer i;

single_port_ram dut (
    .clk(clk),
    .rst(rst),
    .wr_rd(wr_rd),
    .wdata(wdata),
    .rdata(rdata),
    .valid(valid),
    .ready(ready)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    valid = 0;
    wr_rd = 0;
    wdata = 0;
    addr = 0;

    #20 rst = 0;

    repeat(3) begin
        for ( i = 0; i < DEPTH; i = i + 1) begin
            @(posedge clk);
            valid = 1;
            wr_rd = 1;
            wdata = $random & ((1 << WIDTH) - 1);
            addr = i;
            @(posedge clk);
            valid = 0;
        end

        for (i = 0; i < DEPTH; i = i + 1) begin
            @(posedge clk);
            valid = 1;
            wr_rd = 0;
            addr = i;
            @(posedge clk);
            valid = 0;
        end
    end

    #100 $finish;
end

endmodule

