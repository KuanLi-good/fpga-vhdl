module FA(a,b,cin,cout,s);

		input  a,b;
		input cin;
		output s;
		output  cout;
		reg s, cout;
		wire [2:0] cat;

		assign cat = {a,b,cin};

		always @(cat) begin
			case (cat)
			3'b000 : begin cout = 0; s = 0; end
			3'b001 : begin cout = 0; s = 1; end
			3'b010 : begin cout = 0; s = 1; end
			3'b011 : begin cout = 1; s = 0; end

			3'b100 : begin cout = 0; s = 1; end
			3'b101 : begin cout = 1; s = 0; end
			3'b110 : begin cout = 1; s = 0; end
			3'b111 : begin cout = 1; s = 1; end
		endcase
		end

endmodule
