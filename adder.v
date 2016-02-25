`ifndef _adder_
`define _adder_
`define N 4
`define M ('N << 2)


module adder(
	a1	, //MSB input 1
	a0	, //LSB input 1
	b1	, //MSB input 2
	b0	, //LSB input 2
	c1	, //MSB output
	c0	  //LSB output
);

	input a1, a0, b1, b0;
	output c1, c0;

	assign c1 = (~a1)&(~a0)&(b1) | (~a1)&b1&(~b0) | a1&(~a0)&(~b1) | a1&(~b1)&(~b0) | (~a1)&a0&(~b1)&b0;
	assign c0 = (~a0) & b0 | a0 & (~b0);
endmodule

`endif
