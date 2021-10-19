module rtb();
	
	reg clk, enable;
	reg [15:0] data;
	wire [15:0] res;
	
	register regi(.D(data), .clk(clk), .enable(enable), .Q(res));
	
	initial begin
		clk = 1'b0;
		enable = 1'b1;
		data = 16'b0000_0000_0000_0000;
	end
	
	
	always begin
		#50
		clk = ~clk;
		data = data + 16'b0000_0000_0000_0001;
	end
endmodule
	