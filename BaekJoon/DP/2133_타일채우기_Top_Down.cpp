/*
*   Top down
*/

#include <stdio.h>

int memo[31];
int dp(int n);

int main()
{
    int n;
    scanf("%d", &n);
    for (int i = 1; i <= n; i++)
    {
        memo[i] = -1;
    }
    memo[0] = 1;
    memo[1] = 0;

    printf("%d\n", dp(n));

    return 0;
}

int dp(int n)
{
    if (memo[n] >= 0)
    {
        return memo[n];
    }
    if (n < 0 || n % 2 == 1)
    {
        return 0;
    }

    memo[n] = dp(n - 2) * 3;

    for (int i = 2; n - 2 * i >= 0; i++)
    {
        memo[n] += 2 * dp(n - 2 * i);
    }

    return memo[n];
}