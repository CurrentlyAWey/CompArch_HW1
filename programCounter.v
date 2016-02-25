module programCounter (
	jnp,	//If coming from the jnp command, increment by 2 or jnp to the addres dictated by i2 and i0, depending on r2, the register overflow bit
	inc, //If coming from the increment command, simply increment by 1
	r2, // register overflow bit
	i1, //MSB address to jump to, if applicable
	i0, //LSB address to jump to, if applicable
	p1, //MSB of address to give to memory
	p0, //LSB of address to give to memory
	clk,
	rst_n,
);
	input jnp, inc, r2, i1, i0, clk, rst_n;
	output p1, p0;
	wire jnp, inc, r2, i1, i0, p1, p0;
	//internal wires
	wire a1, a0, allowJump, clk_en, mux_to_ff_MSB, mux_to_ff_LSB, Q_to_Adder_MSB, Q_to_Adder_LSB, plusOne_to_encode_MSB, plusOne_to_encode_LSB, plusTwo_to_encode_MSB, plusTwo_to_encode_LSB;
	assign allowJump = (~r2)&jnp;
	assign a1 = inc | allowJump;
	assign a0 = jnp;
	assign clk_en = a1 | a0; 
	dualMux encode(
		.a1(a1),
		.a0(a0),
		.x3(i1),
		.x2(plusOne_to_encode_MSB),
		.x1(plusTwo_to_encode_MSB),
		.x0(1'b0),
		.y3(i0),
		.y2(plusOne_to_encode_LSB),
		.y1(plusTwo_to_encode_LSB),
		.y0(1'b0),
		.i1(mux_to_ff_MSB),
		.i0(mux_to_ff_LSB)
	);
	adder M(
		.a1(Q_to_Adder_MSB),
		.a0(Q_to_Adder_LSB),
		.b1(1'b0),
		.b0(allowJump),
		.c1(p1),
		.c0(p0)
	);
	adder plusOne(
		.a1(Q_to_Adder_MSB),
		.a0(Q_to_Adder_LSB),
		.b1(1'b0),
		.b0(1'b1),
		.c1(plusOne_to_encode_MSB),
		.c0(plusOne_to_encode_LSB)
	);
	adder plusTwo(
		.a1(Q_to_Adder_MSB),
		.a0(Q_to_Adder_LSB),
		.b1(1'b1),
		.b0(1'b0),
		.c1(plusTwo_to_encode_MSB),
		.c0(plusTwo_to_encode_LSB)
	);
	ff c1(
		.clk(clk),
		.clk_en(clk_en),
		.rst_n(rst_n),
		.d3(mux_to_ff_MSB),
		.q(Q_to_Adder_MSB)
	);
	ff c0(
		.clk(clk),
		.clk_en(clk_en),
		.rst_n(rst_n),
		.d3(mux_to_ff_LSB),
		.q(Q_to_Adder_LSB)
	);


endmodule
