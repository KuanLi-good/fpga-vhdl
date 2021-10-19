module threeBit_FA(a,b,cout,s);
		input [2:0] a,b;
		output [2:0] s;

		output cout;
		wire c1,c2;
		wire [2:0] s2;

		FA a0(.a(a[0]),.b(b[0]),.s(s[0]),.cin(1'b0),.cout(c1));
		FA a1(.a(a[1]),.b(b[1]),.s(s[1]),.cin(c1),.cout(c2));
		FA a2(.a(a[2]),.b(b[2]),.s(s[2]),.cin(c2),.cout(cout));
		
		generate i;
		generate
			for (i = 0; i < 16; i = i+1) begin
				FA fa_i(
					.a(a[i]),
					.b(b[i]),
					.s(s[i]),
					.cin(c1),
					.cout(c1)
				);
			end
		endgenerate
endmodule
