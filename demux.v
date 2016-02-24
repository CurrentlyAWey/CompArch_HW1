module demux (in, //Single input 
	c1, //MSB address of demux 
	c2, //LSB address of demux 
	inc, // (00) 
	jnp, // (01) 
	halt, //(10) 
	start //(11)
);
	output inc, jnp, halt, start;
	input in, c1, c2;
	
	wire in, c1, c2, inc, jnp, halt, start;
	
	assign inc = in & (~c1) & (~c2);
	assign jnp = in & (~c1) & (c2);
	assign halt = in & (c1) & (~c2);
	assign start = in & (c1) & (c2);
endmodule
