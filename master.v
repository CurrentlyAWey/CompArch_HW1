module paperProcessor_TB ();
	wire [2:0] registerCount;
	wire [1:0] programCount;
	wire [1:0] stateCount;
	reg clk;
	reg clk_en;
	reg reset;
	
	paperProcessor test(
		.clk(clk),
		.clk_en(clk_en),
		.reset(reset),
		.registerCount(registerCount),
		.programCount(programCount),
		.stateCount(stateCount)
	);
	always #1 begin
		clk = ~clk;
	end
		
	initial begin
		clk = 1'b0;
		clk_en = 1'b0;
		reset = 1'b0;
		$monitor ("registerCount: %b programCount: %b stateCount: %b", registerCount, programCount, stateCount);
	end
endmodule