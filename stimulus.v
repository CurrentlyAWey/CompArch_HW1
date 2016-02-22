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
		$display("d\tclk\tq\tclk_en\trst_n\n"); //Setup Table Headers

		// Initialize Inputs
		d = 1;
		/* Make a regular pulsing clock. */
		clk = 0;
		
		clk_en = 1;
		rst_n = 0;

		#10			rst_n = 1;

		#20			rst_n = 0;

		#20			d = 0;
		#20 		d = 1;
		#20			d = 0;
		#20 		d = 1;
		#20			rst_n = 1;
		#20			d = 0;
		#20 		d = 1;
		#20			d = 0;
		#20 		d = 1;

		#40;

	end

	always #20 clk = !clk;
		
	initial begin
		$monitor("%d\t%d\t%d\t%d\t%d \n",d,clk,q,clk_en,rst_n);
	end

	initial #100 $finish;

endmodule