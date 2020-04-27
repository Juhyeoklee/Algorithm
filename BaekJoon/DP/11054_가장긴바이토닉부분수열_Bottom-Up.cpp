/*
*   Bottom Up
*/

#include <stdio.h>

// direction == 0 : 0 to top
// direction == 1 : top to 0
int memo[1001][2];

int iArr[1001];

int main()
{
    int n;

    scanf("%d", &n);

    for (int i = 1; i <= n; i++)
    {
        scanf("%d", &iArr[i]);
    }

    memo[1][0] = 1;
    memo[n][1] = 1;
    int maxNum = 0;

    for (int i = 2; i <= n; i++)
    {
        memo[i][0] = memo[1][0];

        for (int j = 1; j < i; j++)
        {

            if ((iArr[j] < iArr[i]) && (memo[i][0] < memo[j][0] + 1))
            {
                memo[i][0] = memo[j][0] + 1;
            }
        }
        memo[n - i + 1][1] = memo[n][1];

        for (int j = 0; j < i; j++)
        {
            if (iArr[n - j] < iArr[n - i + 1] && memo[n - i + 1][1] < memo[n - j][1] + 1)
            {
                memo[n - i + 1][1] = memo[n - j][1] + 1;
            }
        }
    }

    for (int i = 1; i <= n; i++)
    {
        if (maxNum < memo[i][0] + memo[i][1])
        {
            maxNum = memo[i][0] + memo[i][1];
        }
    }

    printf("%d\n", maxNum - 1);

    // debugging
    // for (int i = 1; i <= n; i++)
    // {
    //     printf("%d ", memo[i][0]);
    // }
    // printf("\n");
    // for (int i = 1; i <= n; i++)
    // {
    //     printf("%d ", memo[i][1]);
    // }
    // printf("\n");

    return 0;
}
