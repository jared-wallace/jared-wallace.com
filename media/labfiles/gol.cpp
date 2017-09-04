/*
 *Jared Wallace
 *10-08-2014
 *Section 18
 */

#include <iostream>
#include <cstdlib>
#include <time.h>

using namespace std;

void clear_screen();

int main()

{

    // The number of rows and columns
    const int ROWS = 10;
    const int COLS = 10;
    // The number of generations to run
    const int GENERATIONS = 10;
    // Our neighbor counter variable
    int neighbors = 0;
    // The board that will be displayed
    char life[ROWS][COLS];
    char next_generation[ROWS][COLS];
    // Initialize our board to all blanks
    for (int i = 0; i < ROWS; i++)
    {
        // everything here happens once per row
        for (int j = 0; j < COLS; j++)
        {
            //everything here happens once per column (per row)
            life[i][j] = ' ';
            next_generation[i][j] = ' ';
        }
    }

    // We utilize the pseudo random number generator to generate
    // our initial game state
    srand ( time(NULL) );
    int cell;
    // Nested for loops since we have a two-dimensional array
    for(int r = 0; r < ROWS; r++)
    {
        for(int c = 0; c < COLS; c++)
        {
            cell = rand() % 7;
            if(cell >= 5)
            {
                life[r][c] = '*';
            }
            else
            {
                life[r][c]=' ';
            }
        }
    }
    /*

     * Now you have an initialized game board. You need to accomplish two
     * main tasks: Write the code to print out each generation, and set up
     * your "processor", which applies the rules already established
     * (think switch statement).
     */
    for (int i = 0; i < GENERATIONS; i++)
    {
        // Print the game board
        for (int r = 0; r < ROWS; r++)
        {
            for (int c = 0; c < COLS; c++)
            {
                cout << life[r][c];
            }
            cout << endl;
        }

        for (int r = 0; r < ROWS; r++)
        {
            for (int c = 0; c < COLS; c++)
            {
                // Check our neighbors
                neighbors = 0;
                if (r - 1 >= 0 && c - 1 >= 0 && life[r-1][c-1] == '*')
                    neighbors++;
                if (r - 1 >= 0 && life[r-1][c] == '*')
                    neighbors++;
                if (r - 1 >= 0 && c + 1 < COLS && life[r-1][c+1])
                    neighbors++;
                if (c - 1 >= 0 && life[r][c-1] == '*')
                    neighbors++;
                if (c + 1 < COLS && life[r][c+1])
                    neighbors++;
                if (r + 1 < ROWS && c - 1 <= 0 && life[r+1][c-1] == '*')
                    neighbors++;
                if (r + 1 < ROWS && life[r+1][c] == '*')
                    neighbors++;
                if (r + 1 < ROWS && c + 1 < COLS && life[r+1][c+1] == '*')
                    neighbors++;

                // Apply rules
                switch (neighbors)
                {
                    case 0:
                    case 1:
                        next_generation[r][c] = ' ';
                        break;
                    case 2:
                        next_generation[r][c] = life[r][c];
                        break;
                    case 3:
                        next_generation[r][c] = '*';
                        break;
                    default:
                        next_generation[r][c] = ' ';
                }
            }
        }

        // Copy over next_generation to life
        for (int r = 0; r < ROWS; r++)
        {
            for (int c = 0; c < COLS; c++)
                life[r][c] = next_generation[r][c];
        }
    }
    return 0;
}
