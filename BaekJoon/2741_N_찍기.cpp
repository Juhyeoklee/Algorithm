#include <iostream>
#include <stdio.h>

int main()
{
    int num;

    scanf("%d", &num);
    for (int i = 0; i < num; i++)
    {
        printf("%d\n", i + 1);
    }

    return 0;
}