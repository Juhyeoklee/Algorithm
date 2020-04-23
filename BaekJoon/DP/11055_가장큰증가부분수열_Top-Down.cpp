/*
*   Top Down
*/

#include <stdio.h>

int iArr[1001];
int memo[1001];

int dp(int n);

int main()
{
    int n;
    scanf("%d", &n);

    for (int i = 1; i <= n; i++)
    {
        scanf("%d", &iArr[i]);
        memo[i] = -1;
    }
    memo[0] = 0;
    memo[1] = iArr[1];

    dp(n);
    int max = memo[1];
    for (int i = 2; i <= n; i++)
    {
        if (max < memo[i])
        {
            max = memo[i];
        }
    }
    printf("%d\n", max);
    for (int i = 1; i <= n; i++)
    {
        printf("%d ", memo[i]);
    }

    printf("\n");

    return 0;
}

int dp(int n)
{
    if (memo[n] > 0)
    {
        return memo[n];
    }
    int maxNum = 0;

    for (int i = 1; i < n; i++)
    {
        int num = dp(i);

        if (iArr[i] >= iArr[n])
        {
            continue;
        }

        if (maxNum < num)
        {
            maxNum = num;
        }
    }

    memo[n] = maxNum + iArr[n];

    return memo[n];
}