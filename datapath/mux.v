module mux (in1, in2, selection, res);
  input[2:0] in1, in2;
  input selection;
  output reg[2:0] res;

  always @(in1, in2, res) begin
  if(selection == 1'b1)
    res = in1;
  else
    res = in2;
  end
endmodule
