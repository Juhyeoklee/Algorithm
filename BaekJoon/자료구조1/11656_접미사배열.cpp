#include <stdio.h>
#include <iostream>
#include <string>

using namespace std;

int main()
{
    string s;
    cin >> s;
    const int SIZE = s.size();

    int *iArr = new int[SIZE];

    for (int i = 0; i < SIZE; i++)
    {
        int count = 0;
        string word = s.substr(i);

        for (int j = 0; j < SIZE; j++)
        {
            if (word.compare(s.substr(j)) > 0)
            {
                count++;
            }
        }

        iArr[count] = i;
    }

    for (int i = 0; i < SIZE; i++)
    {
        cout << s.substr(iArr[i]) << endl;
    }

    return 0;
}