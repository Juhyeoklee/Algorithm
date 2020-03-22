#include <stdio.h>
#include <iostream>
#include <string>

using namespace std;

int main()
{
    char c[100];

    while (scanf("%10s", &c) == 1)
    {
        printf("%s\n", c);
    }

    return 0;
}
