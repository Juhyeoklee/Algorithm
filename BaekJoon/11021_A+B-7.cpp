#include <stdio.h>
#include <iostream>
#include <string>

using namespace std;

int main()
{
    string s;
    int num;
    int a, b;
    int i = 0;

    scanf("%d", &num);

    while (1)
    {
        if (num == i)
        {
            break;
        }
        scanf("%d%d", &a, &b);

        printf("Case #%d: %d\n", i + 1, a + b);
        i++;
    }

    return 0;
}
