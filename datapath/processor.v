module processor(func, new_func, clk,cur_state, bus, dat, ous, mem_enable, mem_out, reg_dis, reg_val);
	// processor inputs
  input [24:0] func;
  input clk, new_func, mem_enable;
  // {1in, 1out, 2in, 2out, 3in, 3out}
  wire [1:0] op;
  wire data_in, A_in, G_in, G_out;
  output [4:0] cur_state;
  output [15:0] bus;
  wire [15:0] reg_sig;
  wire [15:0] data;
  output [15:0] dat;
  output reg[19:0] ous;
  wire [15:0] addr;
  wire pc_enable;
  
  output [24:0] mem_out;
  reg [24:0] func_in;
  reg new_ins;
  
  // for FPGA
  input [2:0] reg_dis;
  output [15:0] reg_val;
  
  always @(negedge clk)begin
		ous = {data_in, A_in, G_in, G_out, reg_sig};
  
  end
  
  assign dat = data;

  	
	always @(mem_enable, func, mem_out, new_func) begin
		if(mem_enable) begin
			func_in = mem_out;
			new_ins = 1'b1;
		end
		else begin
			func_in = func;
			new_ins = new_func;
		end
	end

  control_unit control(
	.func(func_in), .clk(clk), .new_func(new_ins),
	.reg_sig(reg_sig), .A_in(A_in), .G_in(G_in), .G_out(G_out), 
	.data_in(data_in), .op(op), .state(cur_state),.data(data), .pc(pc_enable));
	
	
	datapath path(.clk(clk), .op(op), .reg_sig(reg_sig), .data_in(data_in)
	, .A_in(A_in), .G_out(G_out),.G_in(G_in), .data(data), .bus_output(bus),.pc_enabled(pc_enable), .addr(addr),
	.reg_dis(reg_dis), .reg_val(reg_val));

	
	rom ram(.addr(addr[2:0]), .clk(clk), .enable(pc_enable), .data_out(mem_out));
	
	
	
endmodule