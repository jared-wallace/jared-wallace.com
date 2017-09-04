#include<cmath>
#include<cstdlib>
#include <iostream>

bool isHappy(int array[], int num, int &pos);
bool isPrime(int num);
bool addToCycle(int array[], int num, int &pos);
bool cycleContains(int array[], int num);
void selectionSort(int array[]);

const int MAX = 20;

int main()
{
    bool prime, happy;
    int num;
    int pos = 0;
    int array[MAX];
    for (int i = 0; i < 20; i++)
        array[i] = 0;

    std::cout << "Enter a number please";
    std::cin>> num;

    prime = isPrime(num);
    // the variable pos is the current index of the latest entry
    // in our array. It's passed by reference
    happy = isHappy(array, num, pos);

    if (prime && happy)
        std::cout << "Yay! A happy prime!";
    else if (prime && !happy)
        std::cout << "Awww...a sad prime number :(";
    else if (!prime && happy)
        std::cout << "A happy number, in any case";
    else
        std::cout << "Well this is depressing, the number is sad and not prime.";

    return 0;

}

bool isPrime(int num)
{
    for (int i = 3; i < num/2; i++)
        if (!(num % i))
            return false;
    return true;
}

bool cycleContains(int array[], int num)
{
    for (int i = 0; i < MAX; i++)
        if (array[i] == num)
            return true;
    return false;
}

bool addToCycle(int array[], int num, int &pos)
{
    if ( cycleContains(array, num) )
        return false;
    if (pos < 19)
    {
        array[pos] = num;
    }
    else
        return false;
    return true;
}

bool isHappy(int array[], int num, int &pos)
{
    bool done = false;
    int sum; // running total of squared digits
    int step; // the individual digit we extract each time

    array[0] = num;

    while(!done)
    {
        sum = 0;
        // Since this may not be our firsty  time through,
        // we grab nums value from the array
        num = array[pos];
        // and increment afterwards
        pos++;
        // Extract each digit and square it before adding the
        // result to our running total
        while(num > 0)
        {
            step = num % 10;
            sum += step * step;
            num /= 10;
        }
        // If the sum is one, we are done (it's happy)
        if (sum == 1)
            return true;
        // Otherwise, we pass the sum off to our helper
        // functions to see whether we have found a cycle
        // or we have completed 20 steps already
        done = !(addToCycle(array, sum, pos));
    }
    // If we make it here, we either found a cycle or ran
    // more than 20 steps
    return false;

}
