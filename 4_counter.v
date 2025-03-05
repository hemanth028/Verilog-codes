module dff (   input d,
               input clk,
               input rstn,
               output reg q,
               output qn);
   always @ (posedge clk or negedge rstn)
      if (!rstn)
         q <= 0;
      else
         q <= d;
   assign qn = ~q;
endmodule
module ripple ( input clk,
                input rstn,
                output [3:0] out);
   wire  q0,qn0;
   wire  q1,qn1;
   wire  q2,qn2;
   wire  q3,qn3;
   dff   dff0 ( .d (qn0),.clk (clk),.rstn (rstn),.q (q0),.qn (qn0));
   dff   dff1 ( .d (qn1),.clk (q0),.rstn (rstn),.q (q1),.qn (qn1));
   dff   dff2 ( .d (qn2),.clk (q1),.rstn (rstn),.q (q2),.qn (qn2));
   dff   dff3 ( .d (qn3),.clk (q2),.rstn (rstn),.q (q3),.qn (qn3));
   assign out = {qn3, qn2, qn1, qn0};
endmodule
