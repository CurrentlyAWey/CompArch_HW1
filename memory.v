`ifndef memory
`define memory
`define N 4
`define M ('N << 2)

module memory (
	address, 
	data
);
	input [1:0] address;
	output [1:0] data;

	reg [1:0] s_memory [0:3];

	assign data = s_memory[address];

	initial $readmemb("doThis.why", s_memory);
endmodule

`endif