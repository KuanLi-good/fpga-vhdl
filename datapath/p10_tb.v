module p10_tb();
	// this tests if the processor could read from memory
	  reg [24:0] func;
	  reg new_func, clk;
	  wire [4:0] cur_state;
	  wire [15:0] bus;
	  wire [15:0] data;
	  wire [19:0] ous;
	  wire [15:0] reg_seg;
	  wire [24:0] mem_out;
	  reg [4:0] counter;
	  reg pc_enabled;
	  reg [2:0] reg_dis;
	  wire [15:0] reg_val;
	  
	  processor my_pros(func, new_func, clk,cur_state, bus, data, ous, 1'b1, mem_out,  reg_dis, reg_val);
	  
	  assign reg_seg = ous[15:0];
	  
	  initial begin
		 clk = 1'b0;
		 reg_dis = 3'b010;
	  end
	  
	  always begin
		 #25
		 clk = ~clk;
	  end
	 
endmodule