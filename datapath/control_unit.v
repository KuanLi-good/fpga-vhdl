module control_unit(
	func, clk, new_func,
	reg_sig, A_in, G_in, G_out, data_in, op, state, data, pc);

  // [instruction(3bits)][op1(3bits)][op2(3bits)][data(16bits)]
  // 000 for load, 001 for move, 010 for add, 011 for xor
  input [24:0] func;
  input clk, new_func;
  // {0in, 0out, 1in, 1out, 2in, 2out}
  output reg[15:0] reg_sig = 16'b0000_0000_0000_0000;
  output reg[1:0] op;
  output reg pc,data_in, A_in, G_in, G_out;
  output reg[15:0] data = 16'b0000_0000_0000_0000;
  

  // states
  reg [4:0] cur_state = 5'b00000;
  wire [4:0] next_state;
  output [4:0] state;
  
  reg port1_in, port1_out, port2_in, port2_out;
  reg [2:0] op1, op2;
  
  fsm my_fsm(.cur(cur_state), .next(next_state), .func(func), .new_func(new_func));
  
  assign state = cur_state;
  
  always @(func) begin
		op1 = func[21:19];
      op2 = func[18:16];
		data = func[15:0];
  end
 
	
  
  always @(op1, port1_in, port1_out,op2, port2_in, port2_out) begin
	 case(op2) 
				3'b000: begin
					reg_sig[15] = port2_in;
					reg_sig[14] = port2_out;
				end
				
				3'b001: begin
					reg_sig[13] = port2_in;
					reg_sig[12] = port2_out;
				end
				
				3'b010: begin
					reg_sig[11] = port2_in;
					reg_sig[10] = port2_out;
				end
				
				3'b011: begin
					reg_sig[9] = port2_in;
					reg_sig[8] = port2_out;
				end
				
				3'b100: begin
					reg_sig[7] = port2_in;
					reg_sig[6] = port2_out;
				end
				
				3'b101: begin
					reg_sig[5] = port2_in;
					reg_sig[4] = port2_out;
				end
				
				3'b110: begin
					reg_sig[3] = port2_in;
					reg_sig[2] = port2_out;
				end
				
				3'b111: begin
					reg_sig[1] = port2_in;
					reg_sig[0] = port2_out;
				end
				
		endcase
		
		     case(op1) 
		3'b000: begin
			reg_sig[15] = port1_in;
			reg_sig[14] = port1_out;
		end
		
		3'b001: begin
			reg_sig[13] = port1_in;
			reg_sig[12] = port1_out;
		end
		
		3'b010: begin
			reg_sig[11] = port1_in;
			reg_sig[10] = port1_out;
		end
		
		3'b011: begin
			reg_sig[9] = port1_in;
			reg_sig[8] = port1_out;
		end
		
		3'b100: begin
			reg_sig[7] = port1_in;
			reg_sig[6] = port1_out;
		end
		
		3'b101: begin
			reg_sig[5] = port1_in;
			reg_sig[4] = port1_out;
		end
		
		3'b110: begin
			reg_sig[3] = port1_in;
			reg_sig[2] = port1_out;
		end
		
		3'b111: begin
			reg_sig[1] = port1_in;
			reg_sig[0] = port1_out;
		end
		
    endcase
  end
  
  always @(posedge clk) begin
	 A_in = 1'b0; 
	 G_in = 1'b0;
	 G_out = 1'b0;
	 data_in = 1'b0;
	 op = 2'b0;
	 port1_in = 1'b0;
	 port1_out = 1'b0;
	 port2_in = 1'b0;
	 port2_out = 1'b0;
	 pc = 1'b0;
  
    case(next_state)
	 
	 5'b00000:
		cur_state = next_state;
		
	 5'b00001:
		cur_state = next_state;
		
	 5'b00010:
		cur_state = next_state;
	
	 // ADD
    5'b00011:
      begin
        port1_out = 1'b1;
		  A_in = 1'b1;
		  cur_state = next_state;
      end
    5'b00100:
      begin
        port2_out = 1'b1;
		  G_in = 1'b1;
		  op = 2'b00;
		  cur_state = next_state;
      end
	 5'b00101:
		begin
		  G_out = 1'b1;
		  port1_in = 1'b1;
		  cur_state = next_state;
		  pc = 1'b1;
		end	
	 	
	 // LOAD
	 5'b00110:
		begin
		  data_in = 1'b1;
		  port1_in = 1'b1;
		  cur_state = next_state;
		  pc = 1'b1;
		end
		
	 // MOVE
	 5'b00111:
		begin
		  port2_out = 1'b1;
		  port1_in = 1'b1;
		  cur_state = next_state;
		  pc = 1'b1;
		end
	 
	 // XOR
	 5'b01000:
		begin
			port1_out = 1'b1;
			A_in = 1'b1;
			cur_state = next_state;
		end
		
	 5'b01001:
		begin
			port2_out = 1'b1;
			G_in = 1'b1;
			op = 2'b01;
			cur_state = next_state;
		end
		
	 5'b01010:
		begin
			G_out = 1'b1;
			port1_in = 1'b1;
			cur_state = next_state;
			pc = 1'b1;
		end
    endcase
  end
endmodule