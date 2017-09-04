#include<iostream>
#include<fstream>

using namespace std;

int main () {

    const int OP_ADD = 0;
    const int OP_SUB = 1;
    const int OP_MUL = 2;
    const int OP_DIV = 3;
    const int OP_RED = 5;
    const int OP_WRITE = 6;
    const int OP_STORE = 7;
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
                myArray[promem[j][1]] = myArray[promem[j][2]] + myArray[promem[j][3]];
                break;
            case OP_SUB:
                myArray[promem[j][1]] = myArray[promem[j][2]] - myArray[promem[j][3]];
                break;
            case OP_MUL:
                myArray[promem[j][1]] = myArray[promem[j][2]] * myArray[promem[j][3]];
                break;
            case OP_DIV:
                myArray[promem[j][1]] = myArray[promem[j][2]] / myArray[promem[j][3]];
                break;
            case OP_RED:
                cout << "Enter the value you would like stored: ";
                cin >> myArray[promem[j][1]];
                break;
            case OP_WRITE:
                cout << myArray[promem[j][1]];
                break;
            case OP_STORE:
                myArray[promem[j][1]] = promem[j][2];
                break;
            default:
                cerr << "Unable to preform operation" << endl;
        }
    }


    return 0;
}
