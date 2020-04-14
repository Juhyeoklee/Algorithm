/*
*   Bottom Up
*/

#include <stdio.h>
#include <algorithm>

using namespace std;

int main()
{
    int T, n;
    scanf("%d", &T);

    for (int i = 0; i < T; i++)
    {

        scanf("%d", &n);

        int iArr[2][n + 1];
        int memo[n + 1][3];

        for (int j = 0; j < 2; j++)
        {
            for (int k = 0; k < n; k++)
            {
                scanf("%d", &iArr[j][k]);
            }
        }

        memo[1][0] = 0;
        memo[1][1] = iArr[0][0];
        memo[1][2] = iArr[1][0];

        for (int j = 2; j <= n; j++)
        {
            memo[j][0] = max(max(memo[j - 1][0], memo[j - 1][1]), memo[j - 1][2]);
            memo[j][1] = max(memo[j - 1][0], memo[j - 1][2]) + iArr[0][j - 1];
            memo[j][2] = max(memo[j - 1][0], memo[j - 1][1]) + iArr[1][j - 1];
        }

        printf("%d\n", max(max(memo[n][0], memo[n][1]), memo[n][2]));
    }

    return 0;
}
