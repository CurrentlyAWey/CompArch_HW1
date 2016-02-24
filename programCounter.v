module programCounter (
	jnp,	//If coming from the jnp command, increment by 2 or jnp to the addres dictated by i2 and i0, depending on r2, the register overflow bit
	inc, //If coming from the increment command, simply increment by 1
	r2, // register overflow bit
	i1, //MSB address to jump to, if applicable
	i0, //LSB address to jump to, if applicable
	p1, //MSB of address to give to memory
	p0 //LSB of address to give to memory
);
	input jnp, inc, r2, i1, i0;
	output p1, p0;
	wire jnp, inc, r2, i1, i0, p1, p0;
	//insert lots of logic here bro
endmodule
