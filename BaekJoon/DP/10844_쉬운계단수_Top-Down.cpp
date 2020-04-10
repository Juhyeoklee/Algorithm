/*
* Top Down
*/

#include <stdio.h>

long long memo[101][10];
long long dp(int size, int endNum);

int main()
{

    int n;
    scanf("%d", &n);

    for (int i = 0; i <= n; i++)
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
    memo[1][0] = 0;
    long long sum = 0;

    for (int i = 0; i < 10; i++)
    {
        sum += dp(n, i);
    }

    printf("%lld\n", sum % 1000000000);

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
        memo[size][endNum] = dp(size - 1, 1) % 1000000000;
    }
    else if (endNum == 9)
    {
        memo[size][endNum] = dp(size - 1, 8) % 1000000000;
    }
    else
    {
        memo[size][endNum] = dp(size - 1, endNum + 1) % 1000000000 + dp(size - 1, endNum - 1) % 1000000000;
    }

    return memo[size][endNum];
}
