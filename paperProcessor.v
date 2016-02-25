module paperProcessor(
	clk,
	clk_en,
	reset,
	registerCount,
	programCount,
	stateCount,
	instruction
);
	input clk, clk_en, reset;
	output wire [2:0] registerCount;
	output wire [1:0] programCount;
	output wire [1:0] stateCount;
	output wire [1:0] instruction;
	wire c1, c0, halt, jnp, inc, start, r2, r1, r0, p1, p0, i1, i0;
	wire [1:0] address;
	assign address = {p1, p0};
	wire [1:0] data;
	assign data = {i1, i0};
	assign registerCount = {r2, r1, r0};
	assign programCount = {p1, p0};
	assign stateCount = {c1, c0};
	assign instruction = {i1, i0};
	processorCore alu (
		.clk(clk),
		.clk_en(clk_en),
		.reset(reset),
		.i1(i1),
		.i0(i0),
		.c1(c1),
		.c0(c0)
	);
	demux decoder (
		.c1(c1),
		.c0(c0),
		.inc(inc),
		.jnp(jnp),
		.halt(halt),
		.start(start)
	);
	registerCounter rCounter (
		.clk(clk),
		.clk_en(inc),
		.rst_n(reset),
		.q2(r2),
		.q1(r1),
		.q0(r0)
	);
	programCounter pCounter (
		.jnp(jnp),
		.inc(inc),
		.r2(r2),
		.i1(i1),
		.i0(i0),
		.p1(p1),
		.p0(p0),
		.clk(clk),
		.rst_n(reset)
	);
	memory r_memory(
		.address(address),
		.data(data)
	);
endmodule
