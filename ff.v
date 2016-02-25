`ifndef ff
`define ff
`define N 4
`define M ('N << 2)

`endif

module ff (
	clk   , // Clock
	clk_en, // Clock Enable
	rst_n , // Asynchronous reset active high
	d3    , // data line
	q     , // output
	q_
);
	input wire clk, clk_en, rst_n, d3;
	output reg q, q_;
	always @(posedge clk,  negedge clk) begin
		if (clk_en & ~rst_n) begin
			q <= d3;
			q_ <= ~d3;
		end else if (rst_n)begin
			q <= 1'b0;
			q_ <= 1'b0;
		end
	end	
endmodule

