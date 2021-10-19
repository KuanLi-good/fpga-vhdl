module fsm(cur, next, func, new_func);
  input [4:0] cur;
  output reg[4:0] next;
  input [24:0] func;
  input new_func;

  always @(cur, next, new_func, func) begin
    case(cur)
		// reset 
      5'b00000: next = 5'b00001;
		
		// wait
		5'b00001: begin
			if(new_func == 1'b1) next = 5'b00010;
		end
		
		// decode state
      5'b00010: begin
        if(func[24:22] == 3'b010)
          next = 5'b00011;
        else if(func[24:22] == 3'b000)
          next = 5'b00110;
		  else if(func[24:22] == 3'b001)
		    next = 5'b00111;
		  else if(func[24:22] == 3'b011)
			 next = 5'b01000;
      end
		
		// ADD
		5'b00011: next = 5'b00100;
		5'b00100: next = 5'b00101;
		5'b00101: next = 5'b00001; // go back to 'wait' state
		
		// LOAD
		5'b00110: next = 5'b00001;
		
		// MOVE
		5'b00111: next = 5'b00001;
		
		// XOR
		5'b01000: next = 5'b01001;
		5'b01001: next = 5'b01010;
		5'b01010: next = 5'b00001;
		
		default: next = 5'b00000;
    endcase
  end
endmodule
