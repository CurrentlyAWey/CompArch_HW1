//Tool for turning instructions into machine code
#include <fstream>
#include <iostream>
#include <string>
#include <cctype>
using namespace std;
int main(int argc, char*argv[]){
	if (argc != 2){
		cout << "Improper usage" << endl << "Usage: " << argv[0] << " filename " << endl;
		return 0;
	}
	ifstream input(argv[1]);	
	if (!input.is_open()){
		cout << "File does not exist" << endl;
		return 0;
	}
	ofstream output("doThis.why");
	while (!input.eof()){
		string instruction;
		getline(input, instruction);
		for (int i = 0; i < instruction.size(); ++i){
			instruction[i] = tolower(instruction[i]);
		}
		cout << instruction << endl;
		if (instruction == "jnp"){
			output << "01" << endl;
		} else if (instruction == "inc"){
			output << "00" << endl;
		} else if (instruction == "halt"){
			output << "10" << endl;
		} else {//is an address value, probably. Not this compiler's job to check
			output << instruction << endl;
		}
	}
	return 0;
}
