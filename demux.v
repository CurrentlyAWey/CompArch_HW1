module demux (
	c1, //MSB address of demux 
	c0, //LSB address of demux 
	inc, // (11) 
	jnp, // (01) 
	halt, //(10) 
	start //(00)
);
	output inc, jnp, halt, start;
	input c1, c0;
	
	wire c1, c0, inc, jnp, halt, start;
	
	assign start = (~c1) & (~c0);
	assign jnp = (~c1) & (c0);
	assign halt = (c1) & (~c0);
	assign inc = (c1) & (c0);
endmodule
