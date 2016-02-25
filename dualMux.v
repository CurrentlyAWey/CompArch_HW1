module dualMux (
	input  a1,
	input a0,
	input x3, //MSB of data at 11
	input x2, //MSB of data at 10
	input x1, //MSB of data at 01
	input x0, //MSB of data at 00
	input y3, //LSB of data at 11
	input y2, //LSB of data at 10
	input y1, //LSB of data at 01
	input y0, //LSB of data at 00

	output i1, //MSB of data from RAM being accessed
	output i0  //LSB of data from RAM being accessed
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
