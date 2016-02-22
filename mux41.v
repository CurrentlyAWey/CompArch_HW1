module mux41 (
	input  a1,
	input a0,
	input d3,
	input d2,
	input d1,
	input d0, // data line
	output q
);

	wire a0_,a1_,and0,and1,and2,and3;

	not(a0_,a0);
	not(a1_,a1);

	and(and0,a0_,a1_,d0);
	and(and1,a0_,a1,d1);
	and(and2,a0,a1_,d2);
	and(and3,a0,a1,d3);
	or(q,and0,and1,and2,and3);
endmodule