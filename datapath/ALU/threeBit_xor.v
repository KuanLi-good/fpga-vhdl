module threeBit_xor(a,b,res);
		input [15:0] a,b;
		output [15:0] res;

	my_xor x1(.in1(a[0]), .in2(b[0]), .res(res[0]));
   my_xor x2(.in1(a[1]), .in2(b[1]), .res(res[1]));
   my_xor x3(.in1(a[2]), .in2(b[2]), .res(res[2]));
	my_xor x4(.in1(a[3]), .in2(b[3]), .res(res[3]));
   my_xor x5(.in1(a[4]), .in2(b[4]), .res(res[4]));
   my_xor x6(.in1(a[5]), .in2(b[5]), .res(res[5]));
	my_xor x7(.in1(a[6]), .in2(b[6]), .res(res[6]));
   my_xor x8(.in1(a[7]), .in2(b[7]), .res(res[7]));
   my_xor x9(.in1(a[8]), .in2(b[8]), .res(res[8]));
	my_xor x10(.in1(a[9]), .in2(b[9]), .res(res[9]));
   my_xor x11(.in1(a[10]), .in2(b[10]), .res(res[10]));
   my_xor x12(.in1(a[11]), .in2(b[11]), .res(res[11]));
	my_xor x13(.in1(a[12]), .in2(b[12]), .res(res[12]));
   my_xor x14(.in1(a[13]), .in2(b[13]), .res(res[13]));
   my_xor x15(.in1(a[14]), .in2(b[14]), .res(res[14]));
	my_xor x16(.in1(a[15]), .in2(b[15]), .res(res[15]));

endmodule
