/*
*   Bottom Up
*/

#include <stdio.h>
#include <algorithm>

int memo[10001][6];
int iArr[10001];
int main()
{
    int n;
    scanf("%d", &n);

    for (int i = 1; i <= n; i++)
    {
        scanf("%d", &iArr[i]);
    }

    memo[1][0] = 0;       // 1 1 0
    memo[1][1] = iArr[1]; // 1 0 1
    memo[1][2] = iArr[1]; // 0 1 1
    memo[1][3] = iArr[1]; // 0 0 1
    memo[1][4] = 0;       // 0 1 0
    memo[1][5] = 0;       // 1 0 0

    for (int i = 2; i <= n; i++)
    {
        memo[i][0] = memo[i - 1][2];
        memo[i][1] = std::max(memo[i - 1][0], memo[i - 1][4]) + iArr[i];
        memo[i][2] = std::max(memo[i - 1][1], memo[i - 1][3]) + iArr[i];
        memo[i][3] = memo[i - 1][5] + iArr[i];
        memo[i][4] = std::max(memo[i - 1][1], memo[i - 1][3]);
        memo[i][5] = std::max(memo[i - 1][0], memo[i - 1][4]);
    }
    for (int i = 0; i <= n; i++)
    {
        for (int j = 0; j < 6; j++)
        {
            printf("%d ", memo[i][j]);
        }
        printf("\n");
    }

    int maxNum = memo[n][0];
    for (int i = 1; i < 6; i++)
    {
        maxNum = std::max(maxNum, memo[n][i]);
    }

    printf("%d\n", maxNum);
    return 0;
}
