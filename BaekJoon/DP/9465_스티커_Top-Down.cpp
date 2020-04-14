/*
*   Top Down
*/

#include <stdio.h>
#include <algorithm>

int iArr[2][100001];
int memo[100001][3];

int dp(int n, int selectedItem);
int max(int n1, int n2)
{
    if (n1 > n2)
        return n1;
    else
        return n2;
}

int main()
{
    int T, n;
    scanf("%d", &T);

    for (int i = 0; i < T; i++)
    {
        scanf("%d", &n);

        for (int j = 0; j < 2; j++)
        {
            for (int k = 0; k < n; k++)
            {
                scanf("%d", &iArr[j][k]);
            }
        }
        for (int i = 0; i <= n; i++)
        {
            for (int j = 0; j < 3; j++)
            {
                memo[i][j] = -1;
            }
        }

        memo[1][0] = 0;
        memo[1][1] = iArr[0][0];
        memo[1][2] = iArr[1][0];

        printf("%d\n", max(max(dp(n, 0), dp(n, 1)), dp(n, 2)));
    }

    return 0;
}

int dp(int n, int selectedItem)
{
    if (memo[n][selectedItem] >= 0)
    {
        return memo[n][selectedItem];
    }

    if (selectedItem == 0)
    {
        memo[n][0] = max(max(dp(n - 1, 0), dp(n - 1, 1)), dp(n - 1, 2));
    }
    else if (selectedItem == 1)
    {
        memo[n][1] = max(dp(n - 1, 0), dp(n - 1, 2)) + iArr[0][n - 1];
    }
    else
    {
        memo[n][2] = max(dp(n - 1, 0), dp(n - 1, 1)) + iArr[1][n - 1];
    }

    return memo[n][selectedItem];
}
