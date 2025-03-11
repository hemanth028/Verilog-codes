module fifo(wr_clk_i,rd_clk_i,rst_i,wr_en_i,rd_en_i,wdata_i,rdata_o,wr_error_o,rd_error_o,full_o,empty_o);

parameter WIDTH= 16;
parameter DEPTH= 16;
parameter PTR_WIDTH=$clog2(DEPTH);

input wr_clk_i,rd_clk_i,rst_i,wr_en_i,rd_en_i;
input [WIDTH-1:0]wdata_i;
output reg [WIDTH-1:0]rdata_o;
output reg  wr_error_o,rd_error_o,full_o,empty_o;

integer i;
reg [PTR_WIDTH-1:0]wr_ptr,rd_ptr;
reg wr_tgl_f,rd_tgl_f;
reg [PTR_WIDTH-1:0]wr_ptr_rd_clk,rd_ptr_wr_clk;
reg wr_tgl_f_rd_clk,rd_tgl_f_wr_clk;
reg [WIDTH-1:0]mem[DEPTH-1:0];
    
    always @(posedge wr_clk_i or posedge rst_i) begin
        if (rst_i) begin
            wr_error_o = 0;
            full_o = 0;
            wr_ptr = 0;
            wr_tgl_f = 0;
            for (i = 0; i < DEPTH; i = i + 1) 
                mem[i] = 0;
        end else if (wr_en_i) begin
            if (full_o) begin
                wr_error_o = 1;
            end else begin
                mem[wr_ptr] = wdata_i;
                if (wr_ptr == DEPTH - 1) begin
                    wr_tgl_f = ~wr_tgl_f;
                    wr_ptr = 0;
                end else begin
                    wr_ptr = wr_ptr + 1;
                end
            end
        end
    end

    // Read operation
    always @(posedge rd_clk_i or posedge rst_i) begin
        if (rst_i) begin
            rd_error_o = 0;
            empty_o = 1;
            rd_ptr = 0;
            rd_tgl_f = 0;
        end else if (rd_en_i) begin
            if (empty_o) begin
                rd_error_o = 1;
            end else begin
                rdata_o = mem[rd_ptr];
                if (rd_ptr == DEPTH - 1) begin
                    rd_tgl_f = ~rd_tgl_f;
                    rd_ptr = 0;
                end else begin
                    rd_ptr = rd_ptr + 1;
                end
            end
        end
    end

    // Full and empty flag logic
    always @(posedge wr_clk_i or posedge rd_clk_i) begin
        if (rst_i) begin
            full_o <= 0;
            empty_o <= 1;
        end else begin
            empty_o <= (wr_ptr_rd_clk == rd_ptr) && (wr_tgl_f_rd_clk == rd_tgl_f);
            full_o <= (wr_ptr == rd_ptr_wr_clk) && (wr_tgl_f != rd_tgl_f_wr_clk);
        end
    end

    // Synchronization logic
    always @(posedge wr_clk_i) begin
        rd_ptr_wr_clk <= rd_ptr;
        rd_tgl_f_wr_clk <= rd_tgl_f;
    end

    always @(posedge rd_clk_i) begin
        wr_ptr_rd_clk <= wr_ptr;
        wr_tgl_f_rd_clk <= wr_tgl_f;
    end

endmodule

