/*
*   Bottom Up
*/

#include <stdio.h>
#include <algorithm>

int memo[301][2];
int iArr[301];

int main()
{
    int n;
    scanf("%d", &n);

    for (int i = 1; i <= n; i++)
    {
        scanf("%d", &iArr[i]);
        memo[i][0] = -1;
        memo[i][1] = -1;
    }
    memo[0][0] = 0;
    memo[0][1] = 0;
    memo[1][0] = iArr[1];
    memo[1][1] = iArr[1];

    for (int i = 2; i <= n; i++)
    {
        memo[i][0] = memo[i - 1][1] + iArr[i];
        memo[i][1] = std::max(memo[i - 2][1], memo[i - 2][0]) + iArr[i];
    }
    printf("%d\n", std::max(memo[n][0], memo[n][1]));

    return 0;
}
