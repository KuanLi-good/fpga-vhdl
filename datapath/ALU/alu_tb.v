module alu_tb();
  reg [15:0] a, b;
  wire [15:0] out;
  reg [1:0] op;

  alu block(.ALU_in1(a), .ALU_in2(b), .op(op), .ALU_out(out));

  initial begin
    a = 16'b0000_0000_0000_0000;
    b = 16'b0000_0000_0000_0010;
    op = 2'b00;
  end

  always begin
		#100
		a = a + 16'b0010_0000_0000_0001;
		b = b + 16'b0001_0000_0100_0010;
	end
		
	always begin
		#50
	if(op == 2'b00)
		op = 2'b01;
	 else
		op = 2'b00;
	end

endmodule
