/*
* Bottom Up
*/

#include <stdio.h>

long long memo[101][10];
long long dp(int size, int endNum);

int main()
{

    int n;
    scanf("%d", &n);

    for (int i = 0; i < 10; i++)
    {
        memo[0][i] = 0;
        memo[1][i] = 1;
    }
    memo[1][0] = 0;

    for (int i = 2; i <= n; i++)
    {
        for (int j = 0; j < 10; j++)
        {
            if (j == 0)
            {
                memo[i][j] = memo[i - 1][1];
            }
            else if (j == 9)
            {
                memo[i][j] = memo[i - 1][8];
            }
            else
            {
                memo[i][j] = (memo[i - 1][j - 1] + memo[i - 1][j + 1]) % 1000000000;
            }
        }
    }

    long long sum = 0;

    for (int i = 0; i < 10; i++)
    {
        sum += memo[n][i];
    }

    printf("%lld\n", sum % 1000000000);

    return 0;
}
