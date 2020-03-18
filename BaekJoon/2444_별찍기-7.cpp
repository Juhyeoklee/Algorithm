#include <stdio.h>
#include <iostream>

using namespace std;

int main()
{
    int num;
    scanf("%d", &num);

    for (int i = 1; i <= num; i++)
    {
        for (int j = num - i; j > 0; j--)
        {
            printf(" ");
        }

        for (int k = 1; k <= 2 * i - 1; k++)
        {
            printf("*");
        }
        printf("\n");
    }

    for (int i = num - 1; i > 0; i--)
    {
        for (int j = i; j < num; j++)
        {
            printf(" ");
        }

        for (int k = 2 * i - 1; k > 0; k--)
        {
            printf("*");
        }
        printf("\n");
    }
    return 0;
}