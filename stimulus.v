// testbench for ff module
`timescale 1ns / 1ps
module stimulus();
	// Inputs
	reg d     ;
	reg clk   ;
	reg clk_en;
	reg rst_n = 0;


	// Outputs
	wire q;

	// Instantiate the Unit Under Test (UUT)
	ff uut (
		.clk   (clk   ),
		.clk_en(clk_en),
		.rst_n (rst_n ),
		.d3    (d    ),
		
		.q    (q     )
	);

	initial begin
		$dumpfile("ff.vcd");
		$dumpvars(21,d,clk,q,clk_en,rst_n);
	end

	initial begin
		// Initialize Inputs
		d = 1;
		/* Make a regular pulsing clock. */
		clk = 0;
		
		clk_en = 1;
		#20			rst_n = 1;
		#5 			clk = 1;
		#5 			clk = 0;
		#5			d = 0;
		#5 			clk = 1;
		#5 			clk = 0;
		#05			d = 1;
		#5 			clk = 1;
		#5 			clk = 0;
		#05			d = 0;

		$display("clk_en stuff");
		#5			clk_en = 0;
		#5 			clk = 1;
		#5 			clk = 0;
		#20 		d = 1;
		#5 			clk = 1;
		#5 			clk = 0;
		#20			rst_n = 0;
		#20			d = 0;
		#5 			clk = 1;
		#5 			clk = 0;
		#20 		d = 1;
		#5 			clk = 1;
		#5 			clk = 0;
		#20			d = 0;
		#20 		d = 1;

		#40;



	end

	always #1 clk = !clk;
		
	initial begin
		$monitor("d: %d\tclk: %d\tq: %d\tclk_en: %d\trst_n: %d \n",d,clk,q,clk_en,rst_n);
	end

	initial #100 $finish;

endmodule