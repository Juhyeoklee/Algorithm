#include <stdio.h>
#include <iostream>

using namespace std;

int main()
{
    int i = 1;
    int num;

    scanf("%d", &num);

    while (i < 10)
    {
        printf("%d * %d = %d\n", num, i, num * i);
        i++;
    }

    return 0;
}
