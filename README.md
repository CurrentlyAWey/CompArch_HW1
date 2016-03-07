# CompArch_HW1
Authors: Zhengqi Xi and Arnold Wey

A simple 2 bit intruction set with 3 instructions: JNP, HALT, and INC. Since this is our first time working with Verilog, the code is quite messy, and definietly can be done cleaner. Also, a C++ file included that takes an input file and compiles it to instructions (doThis.why) to be fed into the Verilog simulator.

*Note:* In the documentation, unless explicitly stated otherwise, modules that contain clk, clk_en, and reset (anything including ff.v) all take the external input clk to the internal input .clk. The only exception is in registerCounter, where .clk\_en  is connected to the INC state.

*Note:* Anything with the format *_tb is a test file for the module. Also, a makefile is not included with this program, since people use different compilers for verilog anyway. It's probably pointless. 

*Note:* JNP is the name we gave to the STATE of the machine, not _J_ump if _N_ot _O_verflow. See transition.jpg in Documentation

## Table of Contents

### Documentation Planning 
Contains logic diagrams of components designed at gate level, as well and Funtional Block Diagrams and a hierarchy of \`includes. 

### Testbenches

Contains testbench code for each component

### paperProcessor_TB.v 
Runs a testBench of the paperProcessor.v

### paperProcessor.v 
"Glues" the processor together. Comprised of: 
	demux.v (decoder)
	processorCore.v (pCore)
	registerCounter.v (rCounter)
	programCounter.v (pCounter)
	memory.v (r_mem)
as well as data[1:0] and address[1:0] lines.

### processorCore.v (pCore)
Takes a two bit instruction and outputs a 2 bit state. That state is decoded, and determines the next action of the paper processor.

External Input: data[1:0]
Internal Input: i1, i0
Output: c1,c0

### demux.v (decoder)
Acts as a decoder for the 2 bit output state from processorCore.v (pCore) and activates or deactivates specific parts of the circuit. 

ex: INC goes to the clk\_en of rCounter, which is clocked every time but isn't enabled unless the _state_ of the paper processor is INC. 

External Input: c1,c0 
Internal Input: c1, c0
Output: INC, JNP, HALT, START

### registerCounter.v (rCounter)
3 bit UpCounter clocked each time, but not enabled unless the machine is in INC mode. eg: See above. 

External Input: INC
Internal Input: clk_en
Output: r2

### programCounter.v (pCounter)
Changes address of memory being read based on the current state of the machine (INC, JNO, etc)

External Input: JNP, INC, r2, data[1:0]
Internal Input: JNP, INC, r2, i1, i0
Output: p1,p0 (--> address [1:0])

### memory.v (r_mem)
Reads a binary file and puts it into a 4 by 2 matrix, bit addressable. 

External Input: address[1:0] 
Internal Input: address[1:0]
Output: data[1:0]
