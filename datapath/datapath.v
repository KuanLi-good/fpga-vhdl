module datapath(clk, op, reg_sig, data_in, A_in, G_in, G_out, data, bus_output, addr, pc_enabled, reg_dis, reg_val);
  input pc_enabled, clk;
  input [1:0] op;
  output [15:0] bus_output;
  input [15:0] reg_sig;
  wire [15:0] bus;
  input [15:0] data;
  
  output [15:0] addr;
  reg[15:0] ph_in;
  
  assign bus_output = bus;
  // control signals
  input data_in, A_in, G_out, G_in;
  wire [15:0] w0, w1, w2, w3, w4, w5, w6, w7;
  wire
  [15:0] ALU_in, ALU_out, G_output;
  
  
   // FPGA
  input [2:0] reg_dis;
  output reg [15:0] reg_val;
  
  reg [15:0] next_addr = 16'b0000_0000_0000_0000;
  
  always @(negedge clk) begin
	if(pc_enabled) begin
		next_addr = next_addr + 16'b0000_0000_0000_0001;
	end
  end
  
  always @(posedge clk) begin
   case(reg_dis)
		3'b000:
			reg_val = w0;
		
		3'b001:
		
			reg_val = w1;
		3'b010:
		
			reg_val = w2;
		3'b011:
			
			reg_val = w3;
		3'b100:
		
			reg_val = w4;
		3'b101:
		
			reg_val = w5;
		3'b110:
		
			reg_val = w6;
		3'b111:
			reg_val = w7;
	
	endcase
  end
  
	
   // ALU
  register a(.D(bus), .clk(clk), .enable(A_in),.Q(ALU_in));
  register g(.D(ALU_out), .clk(clk), .enable(G_in), .Q(G_output));
  tri_buf g_tri(.a(G_output), .b(bus), .enable(G_out));
  
  alu my_alu(.ALU_in1(ALU_in), .ALU_in2(bus), .op(op), .ALU_out(ALU_out));
  
  // Data
  tri_buf data_tri(.a(data),.b(bus),.enable(data_in));
	
  // registers
  register r0(.D(bus), .clk(clk), .enable(reg_sig[15]), .Q(w0));
  register r1(.D(bus), .clk(clk), .enable(reg_sig[13]), .Q(w1));
  register r2(.D(bus), .clk(clk), .enable(reg_sig[11]), .Q(w2));
  register r3(.D(bus), .clk(clk), .enable(reg_sig[9]), .Q(w3));
  register r4(.D(bus), .clk(clk), .enable(reg_sig[7]), .Q(w4));
  register r5(.D(bus), .clk(clk), .enable(reg_sig[5]), .Q(w5));
  register r6(.D(bus), .clk(clk), .enable(reg_sig[3]), .Q(w6));
  register r7(.D(bus), .clk(clk), .enable(reg_sig[1]), .Q(w7));
  
  // this is the pc
  register pc(.D(next_addr), .clk(clk), .enable(1'b1), .Q(addr));

  tri_buf t0(.a(w0),.b(bus), .enable(reg_sig[14]));
  tri_buf t1(.a(w1),.b(bus), .enable(reg_sig[12]));
  tri_buf t2(.a(w2),.b(bus), .enable(reg_sig[10]));
  tri_buf t3(.a(w3),.b(bus), .enable(reg_sig[8]));
  tri_buf t4(.a(w4),.b(bus), .enable(reg_sig[6]));
  tri_buf t5(.a(w5),.b(bus), .enable(reg_sig[4]));
  tri_buf t6(.a(w6),.b(bus), .enable(reg_sig[2]));
  tri_buf t7(.a(w7),.b(bus), .enable(reg_sig[0]));
 
endmodule
