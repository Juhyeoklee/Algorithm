/*
* Top Down
*/

#include <stdio.h>

int memo[1001];
int dp(int n);

int main()
{
    int n;
    scanf("%d", &n);

    for (int i = 0; i <= n; i++)
    {
        memo[i] = -1;
    }
    memo[1] = 1;
    memo[2] = 3;

    printf("%d\n", dp(n));
    return 0;
}

int dp(int n)
{
    if (memo[n] > 0)
    {
        return memo[n];
    }
    memo[n] = (dp(n - 1) + dp(n - 2) * 2) % 10007;

    return memo[n];
}
