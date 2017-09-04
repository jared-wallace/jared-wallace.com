#include<iostream>
#include<fstream>

using namespace std;

int Add(int mem[], int prog[][4], int index)
{
    return mem[ prog[index][2] ] + mem[ prog[index][3] ];
}

int Sub(int mem[], int prog[][4], int index)
{
    return mem[ prog[index][2] ] - mem[ prog[index][3] ];
}

int Mul(int mem[], int prog[][4], int index)
{
    return mem[ prog[index][2] ] * mem[ prog[index][3] ];
}

int Div(int mem[], int prog[][4], int index)
{
    return mem[ prog[index][2] ] / mem[ prog[index][3] ];
}

void Red(int mem[], int prog[][4], int index)
{
    cout << "Please enter a number ";
    cin >> mem[ prog[index][1] ];
    return;
}

void Wrt(int mem[], int prog[][4], int index)
{
    cout << mem[ prog[index][1] ] << endl;
    return;
}

int Sto(int prog[][4], int index)
{
    return prog[index][2];
}

int main () {

    const int OP_ADD = 0;
    const int OP_SUB = 1;
    const int OP_MUL = 2;
    const int OP_DIV = 3;
    const int OP_RED = 5;
    const int OP_WRT = 6;
    const int OP_STO = 7;
    const int OP_JMP = 8;
    const int OP_CJP = 9;
    const int STORAGE = 256;
    int myArray[STORAGE]={0};
    int promem[512][4];
    int i = 0;
    int j = 0;
    string filename;

    cout<< "Enter file name: ";
    cin >> filename;

    ifstream fin;
    fin.open(filename.c_str());
    if(!fin)
        cerr<< "Invalid";


    while (!fin.eof()){
        fin >> promem[i][0] >> promem[i][1] >> promem[i][2] >> promem[i][3];
        i++;
    }

    for(int j = 0; j < i; j++) {
        switch (promem[j][0]) {
            case OP_ADD:
                myArray[promem[j][1]] = Add(myArray, promem, j);
                break;
            case OP_SUB:
                myArray[promem[j][1]] = Sub(myArray, promem, j);
                break;
            case OP_MUL:
                myArray[promem[j][1]] = Mul(myArray, promem, j);
                break;
            case OP_DIV:
                myArray[promem[j][1]] = Div(myArray, promem, j);
                break;
            case OP_RED:
                Red(myArray, promem, j);
                break;
            case OP_WRT:
                Wrt(myArray, promem, j);
                break;
            case OP_STO:
                myArray[promem[j][1]] = Sto(promem, j);
                break;
            case OP_JMP:
                j += promem[j][1];
                j--;
                break;
            case OP_CJP:
                if (myArray[ promem[j][2] ] == myArray[ promem[j][3]])
                {
                    j += promem[j][1];
                    j--;
                }
                break;
            default:
                cerr << "Unable to preform operation" << endl;
        }
    }


    return 0;
}
