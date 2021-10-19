module p6_tb();
	  reg [24:0] func;
	  reg new_func, clk;
	  wire [4:0] cur_state;
	  wire [15:0] bus;
	  wire [15:0] data;
	  wire [19:0] ous;
	  wire [15:0] reg_seg;
	  reg [4:0] counter;
	  
	  processor my_pros(func, new_func, clk,cur_state, bus, data, ous, 1'b0);
	  
	  assign reg_seg = ous[15:0];
	  
	  initial begin
		 clk = 1'b0;
		 new_func = 1'b0;
		 counter = 5'b00000;
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
	    case (counter) 
		    // LOAD R0 1 (001 XXX XXX)
			 // wait
			 5'b00010: begin
				func = 25'b000_000_000_0000_0000_0000_0001;
				new_func = 1'b1;
			 end
			 
			 // decode
			 5'b00011: begin
				func = 25'b000_000_000_0000_0000_0000_0001;
				new_func = 1'b0;
			 end
			 
			 // load
			 5'b00100: begin
				func = 25'b000_000_000_0000_0000_0000_0001;
				new_func = 1'b0;
			 end
			 
			 
			 // MOV R1 R0 (001 001 XXX)
			 // wait
			 5'b00101: begin
				func = 25'b001_001_000_0000_0000_0000_0000;
				new_func = 1'b1;
			 end
			 
			 // decode
			 5'b00110: begin
				func = 25'b001_001_000_0000_0000_0000_0000;
				new_func = 1'b0;
			 end
			 
			 // mov
			 5'b00111: begin
				func = 25'b001_001_000_0000_0000_0000_0000;
				new_func = 1'b0;
			 end
			 
			 // ADD R0 R1 (010 001 XXX)
			 // wait
			 5'b01000: begin
				func = 25'b010_000_000_0000_0000_0000_0000;
				new_func = 1'b1;
			 end
			 
			 //decode
			 5'b01001: begin
				func = 25'b010_000_001_0000_0000_0000_0000;
				new_func = 1'b0;
			 end
			 
			 //add
			 5'b01010: begin
				func = 25'b010_000_001_0000_0000_0000_0000;
				new_func = 1'b0;
			 end
			 
			 5'b01011: begin
				func = 25'b010_000_001_0000_0000_0000_0000;
				new_func = 1'b0;
			 end
			 
			 5'b01100: begin
				func = 25'b010_000_001_0000_0000_0000_0000;
				new_func = 1'b0;
			 end
			 
			 
			 // ADD R0 R1 (011 001 XXX)
			 5'b01101: begin
				func = 25'b010_000_001_0000_0000_0000_0000;
				new_func = 1'b1;
			 end
			 
			 //decode
			 5'b01110: begin
				func = 25'b010_000_001_0000_0000_0000_0000;
				new_func = 1'b0;
			 end
			 
			 //add
			 5'b01111: begin
				func = 25'b010_000_001_0000_0000_0000_0000;
				new_func = 1'b0;
			 end
			 
			 5'b10000: begin
				func = 25'b010_000_001_0000_0000_0000_0000;
				new_func = 1'b0;
			 end
			 
			 5'b10001: begin
				func = 25'b010_000_001_0000_0000_0000_0000;
				new_func = 1'b0;
			 end
			 
			 // ADD R0 R1 (100 001 XXX)
			 5'b10010: begin
				func = 25'b010_000_001_0000_0000_0000_0000;
				new_func = 1'b1;
			 end
			 
			 //decode
			 5'b10011: begin
				func = 25'b010_000_001_0000_0000_0000_0000;
				new_func = 1'b0;
			 end
			 
			 //add
			 5'b10100: begin
				func = 25'b010_000_001_0000_0000_0000_0000;
				new_func = 1'b0;
			 end
			 
			 5'b10101: begin
				func = 25'b010_000_001_0000_0000_0000_0000;
				new_func = 1'b0;
			 end
			 
			 5'b10110: begin
				func = 25'b010_000_001_0000_0000_0000_0000;
				new_func = 1'b0;
			 end
			 
			 // LOAD R2 2 (100 001 010)
			 // wait
			 5'b10111: begin
				func = 25'b000_010_000_0000_0000_0000_0010;
				new_func = 1'b1;
			 end
			 
			 // decode
			 5'b11000: begin
				func = 25'b000_010_000_0000_0000_0000_0010;
				new_func = 1'b0;
			 end
			 // load
			 5'b11001: begin
				func = 25'b000_010_000_0000_0000_0000_0010;
				new_func = 1'b0;
			 end
			 
			 // ADD R0 R2 (110 001 010)
			 5'b11010: begin
				func = 25'b000_010_000_0000_0000_0000_0010;
				new_func = 1'b1;
			 end
			 
			 // decode
			 5'b11011: begin
				func = 25'b000_010_000_0000_0000_0000_0010;
				new_func = 1'b0;
			 end
			 
			 // add
			 5'b11100: begin
				func = 25'b000_010_000_0000_0000_0000_0010;
				new_func = 1'b0;
			 end
			 
			 5'b11101: begin
				func = 25'b000_010_000_0000_0000_0000_0010;
				new_func = 1'b0;
			 end
			 
			 5'b11110: begin
				func = 25'b000_010_000_0000_0000_0000_0010;
				new_func = 1'b0;
			 end
			
		 endcase
	  end

endmodule