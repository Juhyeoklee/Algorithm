#include <stdio.h>
#include <iostream>
#include <string>

using namespace std;

int main()
{
    string s;
    getline(cin, s);

    for (size_t i = 0; i < s.size(); i++)
    {
        char c = s[i];
        if (s[i] >= 'a' && s[i] <= 'z')
        {
            if (c + 13 > 'z')
            {
                c -= 26;
            }
            c += 13;
        }
        else if (s[i] >= 'A' && s[i] <= 'Z')
        {
            if (c + 13 > 'Z')
            {
                c -= 26;
            }
            c += 13;
        }
        else if (s[i] == ' ')
        {
            c = ' ';
        }

        printf("%c", c);
    }

    printf("\n");
    return 0;
}