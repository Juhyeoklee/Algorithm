#include <stdio.h>
#include <iostream>
#include <string>

using namespace std;

int main()
{
    string s;
    int num;
    int i = 0;

    scanf("%d", &num);

    while (1)
    {
        if (num == i)
        {
            break;
        }

        cin >> s;

        int a = s.at(0) - '0';
        int b = s.at(2) - '0';

        printf("%d\n", a + b);
        i++;
    }

    return 0;
}
