#include <stdio.h>
#include <algorithm>

int memo[10001][4];
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
        for (int j = 0; j < 4; j++)
        {
            memo[i][j] = -1;
        }
    }
    memo[1][0] = 6; // n,n-1 모두 선택
    memo[1][1] = 6; // n 선택
    memo[1][2] = 0; // n-1 선택
    memo[1][3] = 0; // 둘다 선택 X
    memo[2][0] = 16;
    memo[2][1] = 10;
    memo[2][2] = 6;
    memo[2][3] = 0;

    printf("%d\n", std::max(std::max(dp(n, 0), dp(n, 1)), std::max(dp(n, 2), dp(n, 3))));

    for (int i = 0; i <= n; i++)
    {
        for (int j = 0; j < 4; j++)
        {
            printf("%d\t", memo[i][j]);
        }
        printf("\n");
    }
    for (int i = 1; i <= n; i++)
    {
        printf("%d ", iArr[i]);
    }
    printf("\n");

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
        memo[n][state] = dp(n - 1, 1) + iArr[n];
        break;
    case 1:
        memo[n][state] = std::max(dp(n - 1, 2), dp(n - 1, 3)) + iArr[n];
        break;
    case 2:
        memo[n][state] = dp(n - 1, 1);
        break;
    case 3:
        memo[n][state] = std::max(dp(n - 1, 2), dp(n - 1, 3));
        break;

    default:
        break;
    }

    return memo[n][state];
}