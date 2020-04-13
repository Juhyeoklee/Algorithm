/*
*   Top Down
*/

#include <stdio.h>

long long memo[91][2];
long long dp(int size, int endNum);

int main()
{
    int n;
    scanf("%d", &n);

    for (int i = 2; i <= n; i++)
    {
        memo[i][0] = -1;
        memo[i][1] = -1;
    }

    memo[0][0] = 0;
    memo[0][1] = 0;
    memo[1][0] = 0;
    memo[1][1] = 1;

    printf("%lld\n", dp(n, 0) + dp(n, 1));

    return 0;
}

long long dp(int size, int endNum)
{
    if (memo[size][endNum] >= 0)
    {
        return memo[size][endNum];
    }

    if (endNum == 0)
    {
        memo[size][endNum] = dp(size - 1, 0) + dp(size - 1, 1);
    }
    else
    {
        memo[size][endNum] = dp(size - 1, 0);
    }

    return memo[size][endNum];
}