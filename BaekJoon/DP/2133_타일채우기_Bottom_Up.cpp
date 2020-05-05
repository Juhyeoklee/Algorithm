/*
*   Bottom Up
*/

#include <stdio.h>

int memo[31];

int main()
{
    int n;
    scanf("%d", &n);
    memo[0] = 1;
    memo[1] = 0;

    for (int i = 2; i <= n; i++)
    {
        memo[i] = memo[i - 2] * 3;

        for (int j = 2; i - j * 2 >= 0; j++)
        {
            memo[i] += memo[i - j * 2] * 2;
        }
    }

    printf("%d\n", memo[n]);

    return 0;
}
