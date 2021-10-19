module p4_tb();
	wire [2:0] bus;
	reg clk;
	reg [1:0] op; 
	reg [5:0] reg_sig;
   reg [2:0] data;
	reg data_in, A_in, G_out, G_in;
	reg [2:0] counter;
	
	datapath path(.clk(clk), .op(op), .reg_sig(reg_sig), .data_in(data_in)
	, .A_in(A_in), .G_out(G_out),.G_in(G_in), .data(data), .bus_output(bus));
	
	initial begin
		clk = 1'b0;
		op = 2'b00;
		reg_sig = 6'b000000;
		data = 3'b010;
		data_in = 1'b0;
		A_in = 1'b0;
		G_out = 1'b0;
		G_in = 1'b0;
		counter = 2'b00;
	end
	
	always begin
		#25
		clk = ~clk;
	end
	
	always begin
		#50
		counter = counter + 3'b001;
	end
	
	always @(posedge clk) begin
		// LOAD 010 INTO REGISTER 01
		case(counter)
			3'b001: begin
				reg_sig = 6'b001000;
				data_in = 1'b1;	
			end
		
			
			3'b010: begin
				data_in = 1'b0;
				reg_sig = 6'b000000;
			end
			
			// LOAD 111 into register 00
			3'b011: begin
				data_in = 1'b1;
				data = 3'b111;
				reg_sig = 6'b100000;
			end
			
			3'b100: begin
				data_in = 1'b0;
				reg_sig = 6'b000000;
			end
			
			// DISPLAY REG 0, REG 1s
			3'b101: begin
				reg_sig = 6'b000100;
			end
			
			3'b110: begin
				reg_sig = 6'b010000;
			end
			
		endcase
	end 
endmodule