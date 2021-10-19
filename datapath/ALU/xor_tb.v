module xor_tb();
  reg [2:0] a, b;
  wire [2:0] res;

  threeBit_xor x(.a(a), .b(b), .res(res));

  initial begin
    a = 3'b000;
    b = 3'b000;
  end

  always begin
		#50
		a = a + 3'b001;
		b = b + 3'b010;
	end
endmodule
