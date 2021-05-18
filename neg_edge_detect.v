`timescale 1ns/1ns
module neg_edge_detect (
   clk,
   rst_n,
   data_in,
   neg_edge 
   );
input      clk;
input      rst_n;
input      data_in;
output     neg_edge;

reg        data_in_d1;
reg        data_in_d2; 

assign neg_edge =  ~data_in_d1 & data_in_d2;

 
always@(posedge clk or negedge rst_n) 
begin
  if (!rst_n)
  begin
    data_in_d1 <=#1 1'b0;
    data_in_d2 <=#1 1'b0;
  end
  else 
  begin
    data_in_d1 <=#1 data_in;
    data_in_d2 <=#1 data_in_d1;   
  end
end
endmodule 
