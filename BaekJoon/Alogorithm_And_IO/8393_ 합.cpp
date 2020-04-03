#include <iostream>
#include <stdio.h>

int main()
{
    int num;
    int sum = 0;

    scanf("%d", &num);
    for (int i = 1; i <= num; i++)
    {
        sum += i;
    }
    printf("%d", sum);

    return 0;
}