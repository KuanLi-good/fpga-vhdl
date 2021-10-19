module alu(ALU_in1, ALU_in2, op, ALU_out);
  // op: 00 for addition, 01 for XOR, 10 for subtraction

  input [15:0] ALU_in1, ALU_in2;
  output reg[15:0] ALU_out;
  input [1:0] op;
  wire [16:0] res;
  
  assign res = {1'b0,ALU_in1[15:0]} + {1'b0,ALU_in2[15:0]};

  always @(op, ALU_in1, ALU_in2) begin
    if (op == 2'b00)  begin
		ALU_out = ALU_in1[15:0] + ALU_in2[15:0];
		
	 end
	 else if (op == 2'b01)
		ALU_out = ALU_in1 ^ ALU_in2;
  end
endmodule
