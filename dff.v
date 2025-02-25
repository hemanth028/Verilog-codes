module dff(input d,clk,rst,output reg q ,qbar);

always @(posedge clk)begin
	if(rst)begin
		q<=1'b0;
		end
	else
		q<=d;
end 
assign qbar =~q;

endmodule
