module single_port_ram(clk,rst,wdata,rdata,wr_rd,valid,ready,addr);
parameter DEPTH=16;
parameter WIDTH=8;
parameter ADDR_WIDTH=4;
integer i;
//PORT DECLARATION
input clk,rst,wr_rd,valid;
input [WIDTH-1:0]wdata;
input [ADDR_WIDTH-1:0]addr;
output reg [WIDTH-1:0]rdata;
output reg ready;
//MEMORY DECLARATION
reg[WIDTH-1:0]mem[DEPTH-1:0];

always @(posedge clk)begin
	if(rst==1)begin
		rdata=0;
		ready=0;
		for(i=0;i<DEPTH;i=i+1)begin
//MAKING ALL REGISTERS TO 0
			mem[i]=0;
		end
	end
	else begin
//CHECKING HANDSHAKING
		if(valid==1)begin
			ready=1;
			if(wr_rd==1)begin
//WRITING DATA INTO MEMORY
				mem[addr]=wdata;
			end
			else begin
//READING DATA FROM MEMORY
				rdata=mem[addr];
			end
		end
		else begin
			ready=0;
		end
	end
end
endmodule
