/*
*   Top Down
*/

#include <stdio.h>

int memo[100001];
int mark[100001];
int iArr[100001];

int dp(int n);

int main()
{
    int n;
    scanf("%d", &n);

    for (int i = 1; i <= n; i++)
    {
        scanf("%d", &iArr[i]);
        mark[i] = -1;
    }
    memo[1] = iArr[1];
    mark[1] = 1;
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

    return 0;
}

int dp(int n)
{

    if (mark[n] > 0)
    {
        return memo[n];
    }
    int pNum = dp(n - 1);
    if (pNum + iArr[n] > iArr[n])
    {
        memo[n] = pNum + iArr[n];
    }
    else
    {
        memo[n] = iArr[n];
    }
    mark[n] = 1;

    return memo[n];
}