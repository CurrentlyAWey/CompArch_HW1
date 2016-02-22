module mux412b (
	input  a1,
	input a0,
	input x3,
	input x2,
	input x1,
	input x0, // data line
	input y3,
	input y2,
	input y1,
	input y0,

	output i1,
	output i0
);

mux41 MSB (
	.a1(a1),
	.a0(a0),
	.d3(x3),
	.d2(x2),
	.d1(x1),
	.d0(x0),
	
	.q (i1)
);

mux41 LSB (
	.a1(a1),
	.a0(a0),
	.d3(y3),
	.d2(y2),
	.d1(y1),
	.d0(y0),
	
	.q (i0)
);


endmodule