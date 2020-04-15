#include <stdio.h>
#include <algorithm>

int memo[10001][6];
int iArr[10001];
int dp(int n, int state);

int main()
{
    int n;
    scanf("%d", &n);

    for (int i = 1; i <= n; i++)
    {
        scanf("%d", &iArr[i]);
    }

    for (int i = 0; i <= n; i++)
    {
        for (int j = 0; j < 6; j++)
        {
            memo[i][j] = -1;
        }
    }

    memo[1][0] = iArr[1]; // 1 1 0
    memo[1][1] = iArr[1]; // 1 0 1
    memo[1][2] = 0;       // 1 1 0
    memo[1][3] = iArr[1]; // 0 0 1
    memo[1][4] = 0;       // 0 1 0
    memo[1][5] = 0;       // 1 0 0

    int maxNum = 0;
    for (int i = 0; i < 6; i++)
    {
        maxNum = std::max(maxNum, dp(n, i));
    }

    printf("%d\n", maxNum);

    return 0;
}

int dp(int n, int state)
{
    if (memo[n][state] >= 0)
    {
        return memo[n][state];
    }

    switch (state)
    {
    case 0:
        memo[n][state] = std::max(dp(n - 1, 1), dp(n - 1, 3)) + iArr[n];
        break;
    case 1:
        memo[n][state] = std::max(dp(n - 1, 2), dp(n - 1, 4)) + iArr[n];
        break;
    case 2:
        memo[n][state] = dp(n - 1, 0);
        break;
    case 3:
        memo[n][state] = dp(n - 1, 5) + iArr[n];
        break;
    case 4:
        memo[n][state] = std::max(dp(n - 1, 1), dp(n - 1, 3));
        break;
    case 5:
        memo[n][state] = std::max(dp(n - 1, 2), dp(n - 1, 4));
        break;

    default:
        break;
    }

    return memo[n][state];
}