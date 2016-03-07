`include "adder.v"

module adder_tb ();
	reg a1, a0, b1, b0;
	wire c1, c0;
	adder test (
		.a1(a1),
		.a0(a0),
		.b1(b1),
		.b0(b0),
		.c1(c1),
		.c0(c0)
	);
	initial begin
		$monitor ($time, "input number 1: %d%d input number 2: %d%d output number: %d%d", a1,a0, b1, b0, c1, c0);
		a1 = 1'b0;
		a0 = 1'b0;
		b1 = 1'b0;
		b0 = 1'b0;
		#1 b0 = ~b0;
		#2 b1 = ~b1;
		#3 b0 = ~b0;
		#4 a0 = ~a0;
		#5 b0 = ~b0;
		#6 b1 = ~b1;
		#7 b0 = ~b0;
		#8 a1 = ~a1;
		#9 b0 = ~b0;
		#10 b1 = ~b1;
		#11 b0 = ~b0;
		#12 a0 = ~a0;
		#13 b0 = ~b0;
		#14 b1 = ~b1;
		#15 b0 = ~b0;
	end
endmodule