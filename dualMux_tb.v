`include "dualMux.v"
module dualMux_tb();
	reg a1, a0, x3, x2, x1, x0, y3, y2, y1, y0;
	wire i1, i0;
	dualMux test(
		.a1(a1),
		.a0(a0),
		.x3(x3),
		.x2(x2),
		.x1(x1),
		.x0(x0),
		.y3(y3),
		.y2(y2),
		.y1(y1),
		.y0(y0),
		.i1(i1),
		.i0(i0)
	);
		
	initial begin
		$monitor($time, " a:%d%d xy: %d%d", a1, a0, i1,i0);
		x3 = 1'b1;
		y3 = 1'b1;
		x2 = 1'b1;
		y2 = 1'b0;
		x1 = 1'b0;
		y1 = 1'b1;
		x0 = 1'b0;
		y0 = 1'b0;
		a1 = 1'b0;
		a0 = 1'b0;
		#1; a0 = ~a0;
		#2 a1 = ~a1;
		#3 a0 = ~a0;
		#4; $stop;

	end
endmodule