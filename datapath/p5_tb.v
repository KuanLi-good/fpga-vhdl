module p5_tb();
	reg clk;
	reg [1:0] op;
	reg [15:0] reg_sig;
	reg data_in, A_in, G_in, G_out;
	reg [15:0] data;
	wire [15:0] bus_output;
	reg [4:0] counter;
	wire [2:0] addr;
	
	datapath path(clk, op, reg_sig, data_in, A_in, G_in, G_out, data, bus_output, addr);
	
	initial begin
		counter = 5'b00000;
		clk = 1'b0;
		op = 2'b00;
		data = 16'b0000_0000_0000_0000;
	end
	
	always begin
		#25
		clk = ~clk;
	end
	
	always begin
		#50
		counter = counter + 5'b00001;
	end
	
	always @(counter) begin
		A_in = 1'b0;
		G_in = 1'b0;
		G_out = 1'b0;
		data_in = 1'b0;
		reg_sig = 16'b0000_0000_0000_0000;
		
		case(counter)
			// LOAD RO 001
			5'b00010: begin
				data = 16'b0000_0000_0000_0001;
				data_in = 1'b1;
				reg_sig = 16'b10_00_00_00_00_00_00_00;
			end
			
			5'b00011: begin
			
			end
			
			// LOAD R1 010
			5'b00100: begin
				data = 16'b0000_0000_0000_0010;
				data_in = 1'b1;
				reg_sig = 16'b00_10_00_00_00_00_00_00;
			end
			
			5'b00101: begin
			
			end
			
			// ADD RO R1
			5'b00110: begin
				reg_sig = 16'b01_00_00_00_00_00_00_00;
				A_in = 1'b1;
			end
			
			5'b00111: begin
				reg_sig = 16'b00_01_00_00_00_00_00_00;
				G_in = 1'b1;
			end
			
			5'b01000: begin
			
			end
			
			5'b01001: begin
				G_out = 1'b1;
				reg_sig = 16'b10_00_00_00_00_00_00_00;
			end
			
						
			// MOV R1 R0
			5'b01011: begin
				reg_sig = 16'b01_10_00_00_00_00_00_00;
			end
			
			// DISPLAY R0, R1
			
			5'b01100: begin
				reg_sig = 16'b01_00_00_00_00_00_00_00;
			end
			
			5'b01101: begin
				reg_sig = 16'b00_01_00_00_00_00_00_00;
			end
			
			// XOR R0 R1;
			5'b01111: begin
				A_in = 1'b1;
				reg_sig = 16'b01_00_00_00_00_00_00_00;
			end
			
			5'b10000: begin
				op = 2'b01;
				G_in = 1'b1;
				reg_sig = 16'b00_01_00_00_00_00_00_00;
			end
			
			5'b10001: begin
			
			end
			
			5'b10010: begin
				G_out = 1'b1;
				reg_sig = 16'b10_00_00_00_00_00_00_00;
			end
			
			// display r0 r1
			5'b10011: begin
			
			end
			
			5'b10100: begin
				reg_sig = 16'b01_00_00_00_00_00_00_00;
			end
			
			5'b10101: begin
				reg_sig = 16'b00_01_00_00_00_00_00_00;
			end
		endcase
	end
	
endmodule