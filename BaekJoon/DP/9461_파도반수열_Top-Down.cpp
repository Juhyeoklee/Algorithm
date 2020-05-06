/*
* Top Down
*/

#include <stdio.h>

long long memo[101];
long long dp(int n);

int main()
{
    int t, n;
    scanf("%d", &t);

    for (int i = 0; i < t; i++)
    {
        scanf("%d", &n);
        for (int i = 0; i <= n; i++)
        {
            memo[i] = -1;
        }
        memo[0] = 0;
        memo[1] = 1;
        memo[2] = 1;
        memo[3] = 1;
        memo[4] = 2;

        printf("%lld\n", dp(n));
    }

    return 0;
}

long long dp(int n)
{
    if (memo[n] >= 0)
    {
        return memo[n];
    }

    if (n - 5 >= 0)
    {
        memo[n] = dp(n - 1) + dp(n - 5);
    }

    return memo[n];
}