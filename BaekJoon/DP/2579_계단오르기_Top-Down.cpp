/*
*   Top Down
*/

#include <stdio.h>
#include <algorithm>
int memo[301][2];
int iArr[301];

int dp(int n, int bfStair);

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

    printf("%d\n", std::max(dp(n, 0), dp(n, 1)));

    return 0;
}

int dp(int n, int bfStair)
{
    if (memo[n][bfStair] >= 0)
    {
        return memo[n][bfStair];
    }

    if (bfStair == 0)
    {
        memo[n][bfStair] = dp(n - 1, 1) + iArr[n];
    }
    else
    {
        memo[n][bfStair] = std::max(dp(n - 2, 0), dp(n - 2, 1)) + iArr[n];
    }

    return memo[n][bfStair];
}