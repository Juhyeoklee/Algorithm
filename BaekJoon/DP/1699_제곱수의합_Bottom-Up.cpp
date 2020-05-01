/*
*   Bottom Up
*/

#include <stdio.h>

int memo[100001];

int main()
{
    int n;
    scanf("%d", &n);

    memo[0] = 0;
    memo[1] = 1;

    for (int i = 2; i <= n; i++)
    {
        memo[i] = i;

        for (int j = 1; j * j <= i; j++)
        {
            if (memo[i] > memo[i - j * j] + 1)
            {
                memo[i] = memo[i - j * j] + 1;
            }
        }
    }
    printf("%d\n", memo[n]);

    return 0;
}
