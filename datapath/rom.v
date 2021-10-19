module rom(addr, clk, enable, data_out);
	input [2:0] addr;
	output reg [24:0] data_out;
	input clk, enable;
	reg[31:0] mem [7:0];
	
	reg[15:0] data_0 = 16'b0000_0000_0000_0000;
	reg[15:0] data_1 = 16'b0000_0000_0000_0001;
	reg[15:0] data_3 = 16'b0000_0000_0000_0011;
	
	reg [31:0] def;
	
	reg[6:0] padding = 7'b0000_000;
	always @(posedge clk) begin
	   def = {padding, 9'b000_000_000, data_0}; 
		mem[0] <= {padding, 9'b000_010_000, data_1}; // load r2 1 
		mem[1] <= {padding, 9'b000_001_000, data_1}; // load r1 1 
		mem[2] <= {padding, 9'b010_010_001, data_0}; // add r2 r1
		mem[3] <= {padding, 9'b011_010_001, data_0}; // xor r2 r1
		mem[4] <= {padding, 9'b001_111_001, data_0}; // mov r7 r1
		mem[5] <= {padding, 9'b000_000_000, data_0};
		mem[6] <= {padding, 9'b000_000_000, data_0};
		mem[7] <= {padding, 9'b000_000_000, data_0};
		

		data_out[24:0] = mem[addr][24:0];
	end
endmodule