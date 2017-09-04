/*
 * This is a sample solution for the coding section of our lab1.
 * I'm providing this for two main reasons; one, it gives you an
 * opportunity to see good style and coding practice, and two,
 * it allows people who may not have a working program avoid
 * falling behind when we move on to the next part of this lab.
 *
 * Name: Jared Wallace
 * Date: September 4, 2014
 * Section: 18
 *
 * This small program will serve as the base for the assembler
 * we will be writing. This program, in and of itself, will
 * not make a whole lot of sense. Later, it will become more
 * clear the reason why we wrote it this way.
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
    const int OP_EXP = 5;
    const int OP_RED = 6;
    const int OP_WRT = 7;

    int inst = 0;
    int data0 = 0;
    int data1 = 0;
    int data2 = 0;

    // Always good to prompt the user as verbosely as possible
    cout << "Please enter the value for the instruction ";
    cin >> inst;
    cout << endl << "Please enter the value for the data0 field ";
    cin >> data0;
    cout << endl << "Please enter the value for the data1 field ";
    cin >> data1;
    cout << endl << "Please enter the value for the data2 field ";
    cin >> data2;

    // Addition
    data0 = data1 + data2;
    cout << endl << "data1 plus data2 equals: ";
    cout << data0;
    // Subtraction
    data0 = data1 - data2;
    cout << endl << "data1 minus data2 equals: ";
    cout << data0;
    // Multiplication
    data0 = data1 * data2;
    cout << endl << "data1 times data2 equals: ";
    cout << data0;
    // Division
    data0 = data1 / data2;
    cout << endl << "data1 divided by data2 equals: ";
    cout << data0;
    // Modulo
    data0 = data1 % data2;
    cout << endl << "data1 modulo data2 equals: ";
    cout << data0 << endl;

    return EXIT_SUCCESS; // A little more readable than '0'
}
