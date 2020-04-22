/*
*   Top Down
*/
#include <stdio.h>
#include <algorithm>
int memo[1001];
int iArr[1001];

int dp(int n);

int main()
{
    int n;
    scanf("%d", &n);

    for (int i = 0; i < n; i++)
    {
        scanf("%d", &iArr[i]);
        memo[i] = -1;
    }
    memo[n] = -1;
    memo[0] = 0;
    memo[1] = 1;
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

    return 0;
}

int dp(int n)
{
    if (memo[n] >= 0)
    {
        return memo[n];
    }

    int max = memo[1];
    int maxIndex = 1;
    for (int i = 2; i < n; i++)
    {
        int num = dp(i);
        if (iArr[n - 1] < iArr[i - 1])
        {
            continue;
        }
        if (max <= num)
        {
            max = num;
            maxIndex = i;
        }
    }

    if (iArr[n - 1] > iArr[maxIndex - 1])
    {
        memo[n] = max + 1;
    }
    else if (iArr[n - 1] == iArr[maxIndex - 1])
    {
        memo[n] = max;
    }
    else
    {
        memo[n] = 1;
    }

    return memo[n];
}