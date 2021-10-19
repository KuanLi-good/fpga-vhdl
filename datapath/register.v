module register(D, clk, enable, Q);
  input [15:0] D;
  input clk, enable;
  output reg[15:0] Q;

  always @(negedge clk) begin
		if(enable == 1'b1)
			Q <= D;
  end
endmodule
