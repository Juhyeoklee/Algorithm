/*
* Bottom Up
*/

#include <stdio.h>

int memo[1001][10];

int main()
{
    int size;
    scanf("%d", &size);

    for (int i = 0; i <= size; i++)
    {
        for (int j = 0; j < 10; j++)
        {
            memo[i][j] = -1;
        }
    }

    for (int i = 0; i < 10; i++)
    {
        memo[0][i] = 0;
        memo[1][i] = 1;
    }

    size_t sum = 0;

    for (int i = 2; i <= size; i++)
    {
        for (int j = 0; j < 10; j++)
        {
            memo[i][j] = 0;
            for (int k = 0; k <= j; k++)
            {
                memo[i][j] += memo[i - 1][k] % 10007;
            }
        }
    }

    for (int i = 0; i < 10; i++)
    {
        sum += memo[size][i];
    }

    printf("%lu\n", sum % 10007);

    return 0;
}
