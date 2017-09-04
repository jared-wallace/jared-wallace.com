/*
 *Name: Jared Wallace
 *Date: 09-05-2014
 *Section: 18
 *
 * Answers to questions:
 *      1)  const int NUM = 200;
 *          int x = 0;
 *          cout << "Please enter the value of x";
 *          cin >> x;
 *          if (x < NUM)
 *          {
 *              cout << "Hooray";
 *          }
 *      2)  T && F = F
 *          T || F = T
 *          F && F = F
 *          !(T && T) = F
 *          !T && T = F
 *      3)  3
 *          awww...
 *          4
 *
 *This program will function as a simple calculator, only performing one
 *operation at a time.
 */

#include <iostream>
#include <cstdlib>
#include <cmath> // For the pow operation (Not required for this lab)

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

    cout << "Please enter the value for the instruction ";
    cin >> inst;
    cout << endl << "\nPlease enter the first operand ";
    cin >> data1;
    cout << endl << "\nPlease enter the second operand ";
    cin >> data2;

    if (inst == OP_ADD)
        data0 = data1 + data2;
    else if (inst == OP_SUB)
        data0 = data1 - data2;
    else if (inst == OP_MUL)
        data0 = data1 * data2;
    else if (inst == OP_DIV)
        data0 = data1 / data2;
    else if (inst == OP_MOD)
        data0 = data1 % data2;
    else if (inst == OP_EXP) // Not required for this lab
        data0 = pow(data1, data2);
    else
    {
        cout << "\nUnable to perform operation.";
        data0 = -1;
    }

    cout << "\nYour calculation is complete.";
    if (data0 != -1)
        cout << "\nThe result is " << data0 << endl;
    else
        cout << "\nNo result obtained.\n";

    return EXIT_SUCCESS;
}

