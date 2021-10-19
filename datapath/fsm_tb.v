module fsm_tb();
	reg [4:0] cur;
	reg [24:0] func;
	wire [4:0] next;
	wire [2:0] operation;
	reg new_func;
	reg [4:0] counter;
	
	fsm my_fsm(.cur(cur), .next(next), .func(func), .new_func(new_func));
	
	initial begin
		cur = 5'b00000;
		new_func = 1'b0;
		func = 25'b000_000_100_1000_0000_0000_0000;
		counter = 5'b00000;
	end
	
	assign operation = func[24:22];
	
	always begin
		#50
		counter = counter + 5'b00001;
	end
	
	always @(counter) begin
		case(counter)
			5'b00000:
				cur = next;
		
			// WAIT STATE
			5'b00001: begin
				func = 25'b000_000_000_0000_0000_0000_0000;
				new_func = 1'b1;
				cur = next;
			end
			
			// DECODE STATE
			
			5'b00010: begin
				func = 25'b000_000_100_1000_0000_0000_0000;
				new_func = 1'b1;
				cur = next;
			end
			
			// LOAD
			5'b00011: begin
				func = 25'b000_000_100_1000_0000_0000_0000;
				new_func = 1'b0;
				cur = next;
			end
			
			/*
			
			// WAIT
			5'b00100: begin
				func = 10'b0100000000;
				new_func = 1'b0;
				cur = next;
			end
			
			// DECODE
			5'b00101: begin
				func = 10'b0100000000;
				new_func = 1'b1;
				cur = next;
			end
			
			// ADD
			5'b00110: begin
				func = 10'b0100000000;
				new_func = 1'b0;
				cur = next;
			end
			
			5'b00111: begin
				func = 10'b0100000000;
				new_func = 1'b0;
				cur = next;
			end
			
			5'b01000: begin
				func = 10'b0100000000;
				new_func = 1'b0;
				cur = next;
			end
			
			// WAIT
			5'b01001: begin
				func = 10'b0010000000;
				new_func = 1'b0;
				cur = next;
			end
			// DECODE
			5'b01010: begin
				func = 10'b0010000000;
				new_func = 1'b1;
				cur = next;
			end
			//MOVE
			5'b01011: begin
				func = 10'b0010000000;
				new_func = 1'b1;
				cur = next;
			end
			// WAIT
			5'b01100: begin
				func = 10'b0010000000;
				new_func = 1'b0;
				cur = next;
			end
			//DECODE
			5'b01101: begin
				func = 10'b0010000000;
				new_func = 1'b1;
				cur = next;
			end
			// XOR
			5'b01110: begin
				func = 10'b0110000000;
				new_func = 1'b0;
				cur = next;
			end
			
			5'b01111: begin
				func = 10'b0110000000;
				new_func = 1'b0;
				cur = next;
			end
			
			5'b10000: begin
				func = 10'b0110000000;
				new_func = 1'b0;
				cur = next;
			end
			
			5'b10001: begin
				func = 10'b0110000000;
				new_func = 1'b0;
				cur = next;
			end
			
			5'b10010: begin
				func = 10'b0110000000;
				new_func = 1'b0;
				cur = next;
			end*/
			
		endcase
	end
	
endmodule