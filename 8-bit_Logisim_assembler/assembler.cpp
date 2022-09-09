#include <iostream>
#include <fstream>
#include <string> 

using namespace std; 

int main(int argc, char *argv[])
{
    ifstream prog_input(argv[1]);
    ofstream prog_output(argv[2]);

    string input_bytes;
    string output_bytes;

    prog_output << "v2.0 raw\n4*0 ";

    while(prog_input >> input_bytes)  
    {
        printf("Input: %s\n", input_bytes.c_str());
        if (input_bytes.compare("LDX") == 0 )
        {
            output_bytes = output_bytes + "01 ";
        }
	else if (input_bytes.compare("LDY") == 0 )
	{
	    output_bytes = output_bytes + "02 ";
	}
	else if (input_bytes.compare("LDA") == 0 )
	{
	    output_bytes = output_bytes + "03 ";
	}
	else if (input_bytes.compare("ADC") == 0 )
        {
            output_bytes = output_bytes + "04 ";
        }
	else if (input_bytes.compare("SEC") == 0 )
        {
            output_bytes = output_bytes + "05 ";
        }
	else if (input_bytes.compare("BCS") == 0 )
        {
            output_bytes = output_bytes + "07 ";
        }
       else if (input_bytes.compare("CLC") == 0 )
        {
            output_bytes = output_bytes + "08 ";
        }
       else if (input_bytes.compare("TAX") == 0 )
        {
            output_bytes = output_bytes + "09 ";
        }
       else if (input_bytes.compare("JMP") == 0 )
        {
            output_bytes = output_bytes + "0b ";
        }
       else if (input_bytes.compare("STA") == 0 )
        {
            output_bytes = output_bytes + "0c ";
        }
	else
	{
	    output_bytes = output_bytes + input_bytes + " ";
	}
    }

    prog_output << output_bytes; 
    prog_input.close(); 
    prog_output.close(); 
}	
