module control_tb();
	// [instruction(3bits)][op1(2bits)][op2(2bits)][data(3bits)]
  reg [24:0] func;
  reg clk, new_func;
  // {1in, 1out, 2in, 2out, 3in, 3out}
  wire [15:0] reg_sig;
  wire [1:0] op;
  wire data_in, A_in, G_in, G_out;
  wire [4:0] state;
  wire [15:0] data;
  reg [4:0] count;

  control_unit control(
	.func(func), .clk(clk), .new_func(new_func),
	.reg_sig(reg_sig), .A_in(A_in), .G_in(G_in), .G_out(G_out), 
	.data_in(data_in), .op(op), .state(state),.data(data));

  initial begin
		clk = 1'b0;
		count = 5'b00000;
  end

  always begin
		#25
		clk = ~clk;
  end

  always begin
	  #50
	  count = count + 5'b00001;
  end

  always @(count, func, new_func) begin
		case(count)
			5'b00010: begin
				func = 25'b000_001_000_0000_0000_0000_1111;  //ADD R0 R1
				new_func = 1'b1;
			end


			5'b00011: begin
				func = 25'b000_001_000_0000_0000_0000_1111;  //ADD R0 R1
				new_func = 1'b0;
			end

			5'b00100: begin
				func = 25'b000_001_000_0000_0000_0000_1111;  //ADD R0 R1
				new_func = 1'b0;
			end

			5'b00101: begin
				func = 25'b000_001_000_0000_0000_0000_1111;  //ADD R1 R0
				new_func = 1'b0;
			end
			5'b00110: begin
				func = 10'b0100100111;  //ADD R1 R0
				new_func = 1'b0;
			end
			
			/*
			5'b00111: begin
				func = 10'b0100100111;  //ADD R1 R0
				new_func = 1'b0;
			end
			5'b01000: begin
				func = 10'b0100100111;  //ADD R1 R0
				new_func = 1'b0;
			end
			5'b01001: begin
				func = 10'b0011000000;  //ADD R1 R0
				new_func = 1'b1;
			end
			5'b01010: begin
				func = 10'b0011000000;  //ADD R1 R0
				new_func = 1'b0;
			end
			5'b01011: begin
				func = 10'b0011000000;  //ADD R1 R0
				new_func = 1'b0;
			end
			5'b01100: begin
				func = 10'b0011000000;  //ADD R1 R0
				new_func = 1'b0;
			end
			5'b01101: begin
				func = 10'b0110000000;  //ADD R1 R0
				new_func = 1'b1;
			end
			5'b01110: begin
				func = 10'b0110000000;  //ADD R1 R0
				new_func = 1'b0;
			end
			5'b01111: begin
				func = 10'b0110000000;  //ADD R1 R0
				new_func = 1'b0;
			end
			5'b10000: begin
				func = 10'b0110000000;  //ADD R1 R0
				new_func = 1'b0;
			end
			5'b10001: begin
				func = 10'b0110000000;  //ADD R1 R0
				new_func = 1'b0;
			end
			5'b10010: begin
				func = 10'b0110000000;  //ADD R1 R0
				new_func = 1'b0;
			end
			5'b10011: begin
				func = 10'b0000000100;  //ADD R1 R0
				new_func = 1'b1;
			end
			5'b10100: begin
				func = 10'b0000000100;  //ADD R1 R0
				new_func = 1'b0;
			end
			5'b10101: begin
				func = 10'b0000000100;  //ADD R1 R0
				new_func = 1'b0;
			end
			5'b10110: begin
				func = 10'b0000000100;  //ADD R1 R0
				new_func = 1'b0;
			end
			5'b10111: begin
				func = 10'b0000000100;  //ADD R1 R0
				new_func = 1'b0;
			end
			*/
		endcase
  end
endmodule
