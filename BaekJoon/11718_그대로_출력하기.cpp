#include <stdio.h>
#include <iostream>
#include <string>

using namespace std;

int main()
{
    string s;
    while (!cin.eof())
    {
        getline(cin, s);
        cout << s << endl;
    }

    return 0;
}
