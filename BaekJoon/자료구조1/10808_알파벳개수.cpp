#include <stdio.h>
#include <iostream>
#include <string>

using namespace std;

int main()
{
    string s;

    cin >> s;

    for (int i = 97; i <= 122; i++)
    {
        int count = 0;
        for (int j = 0; j < s.size(); j++)
        {
            if (i == s[j])
            {
                count++;
            }
        }
        printf("%d", count);
        if (i == 122)
        {
            break;
        }
        printf(" ");
    }
    printf("\n");
    return 0;
}