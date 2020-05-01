/*
*   Top Down
*/

#include <stdio.h>
int memo[100001];
int dp(int n);
int main()
{
    int n;
    scanf("%d", &n);
    for (int i = 0; i <= n; i++)
    {
        memo[i] = -1;
    }
    memo[0] = 0;
    memo[1] = 1;

    printf("%d\n", dp(n));

    return 0;
}

int dp(int n)
{
    if (memo[n] >= 0)
    {
        return memo[n];
    }
    int tmp = 0;
    int minN = 999999999;

    for (int i = 1; i <= n; i++)
    {
        if (n < i * i)
        {
            break;
        }

        int tmp = dp(n - i * i);
        if (tmp < minN)
        {
            minN = tmp;
        }
    }

    memo[n] = minN + 1;

    return memo[n];
}