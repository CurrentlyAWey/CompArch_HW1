`ifndef paperProcessor
`define paperProcessor
`define N 4
`define M ('N << 2)
`include "processorCore.v"
`include "programCounter.v"
`include "registerCounter.v"
`include "demux.v"
`include "memory.v"
	
	
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
	
	wire c1, c0, halt, jnp, inc, start, r2, r1, r0;
	wire [1:0] address;
	wire [1:0] data;
	assign registerCount = {r2, r1, r0};
	assign programCount = address;
	assign stateCount = {c1, c0};
	assign instruction = data;
	processorCore pCore (
		.clk(clk),
		.clk_en(clk_en),
		.reset(reset),
		.i1(data[1]),
		.i0(data[0]),
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
		.r2(r2),
		.r1(r1),
		.r0(r0)
	);
	programCounter pCounter (
		.jnp(jnp),
		.inc(inc),
		.r2(r2),
		.i1(data[1]),
		.i0(data[0]),
		.p1(address[1]),
		.p0(address[0]),
		.clk(clk),
		.rst_n(reset)
	);
	memory r_memory(
		.address(address),
		.data(data)
	);
endmodule

`endif