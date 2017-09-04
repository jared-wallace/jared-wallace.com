/*
 * Name: Jared Wallace
 * Date: September 24, 2014
 * Section: 18
 *
 * This is our first extension of the assembler we began writing
 * in the first lab.
 *
 */
#include <iostream>
#include <cstdlib> // Not required, but allows EXIT_SUCCESS

using namespace std;

int main()
{
    const int OP_ADD = 0;
    const int OP_SUB = 1;
    const int OP_MUL = 2;
    const int OP_DIV = 3;
    const int OP_MOD = 4;
    const int OP_RED = 5;
    const int OP_WRT = 6;
    const int OP_STO = 7;

    int inst = 0;
    int data0 = 0;
    int data1 = 0;
    int data2 = 0;

    int data_memory[256] = {0};
    int number_instructions = 0;

    cout << "Please enter the number of lines in the program";
    cin >> number_instructions;

    for(int i = 0; i < number_instructions; i++)
    {
        // When inputting the instruction, you can separate the numbers
        // with spaces instead of pressing enter.
        cout << "Please enter the instruction line: ";
        cin >> inst >> data0 >> data1 >> data2;


        switch (inst)
        {
            case OP_ADD:
                data_memory[data0] = data_memory[data1] + data_memory[data2];
                break;
            case OP_SUB:
                data_memory[data0] = data_memory[data1] - data_memory[data2];
                break;
            case OP_MUL:
                data_memory[data0] = data_memory[data1] * data_memory[data2];
                break;
            case OP_DIV:
                data_memory[data0] = data_memory[data1] / data_memory[data2];
                break;
            case OP_MOD:
                data_memory[data0] = data_memory[data1] % data_memory[data2];
                break;
            case OP_RED:
                cout << "Enter the value please. ";
                cin >> data_memory[data0];
                break;
            case OP_WRT:
                cout << data_memory[data0];
                break;
            case OP_STO:
                data_memory[data0] = data1;
                break;
            default:
                cout << "\nUnable to perform operation.";
        }
    }
    return EXIT_SUCCESS; // A little more readable than '0'
}
