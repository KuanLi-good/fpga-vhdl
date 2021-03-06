module adder_tb();
	reg [2:0] a, b;
	reg cin;
	wire cout;
	wire[2:0] out;

	threeBit_FA fa(.a(a), .b(b), .cin(cin), .cout(cout), .s(out));

	initial begin
		a = 3'b000;
		b = 3'b000;
		cin = 1'b0;
	end

	always begin
		#50
		a = a + 3'b001;
		b = b + 3'b001;
	end


endmodule
