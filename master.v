`include "paperProcessor.v"
module paperProcessor_TB ();
	wire [2:0] registerCount;
	wire [1:0] programCount;
	wire [1:0] stateCount;
	wire [1:0] instruction;
	reg clk;
	reg clk_en;
	reg reset;
	
	paperProcessor test(
		.clk(clk),
		.clk_en(clk_en),
		.reset(reset),
		.registerCount(registerCount),
		.programCount(programCount),
		.stateCount(stateCount),
		.instruction(instruction)
	);
	always #1 begin
		clk = ~clk;
		if (stateCount[1] & ~stateCount[0]) begin
			$display ("HALT");
			$finish;
		end
	end
		
	initial begin
		$dumpfile("runData.vcd");
		$dumpvars(0, paperProcessor_TB);
		clk = 1'b0;
		clk_en = 1'b0;
		reset = 1'b1;
		$monitor ($time, " clock: %d register: %b program: %b state: %b data: %b", clk,registerCount, programCount, stateCount, instruction);
		#2 reset = ~reset;
		#3 clk_en = ~clk_en;
	end
endmodule
