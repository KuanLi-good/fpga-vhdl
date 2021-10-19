module mem_tb();
	reg[2:0] addr;
	reg clk, enable;
	wire [24:0] data_out;
	rom my_rom(addr, clk, enable, data_out);
	
	initial begin
		clk = 1'b0;
		enable = 1'b0;
		addr = 3'b000;
		
		#10 addr = 3'b000;
		#10 addr = 3'b001;
		enable = 1'b1;
		#10 addr = 3'b010;
	end
	
	always 
		begin
			#5
			clk = ~clk;
		end
	
endmodule